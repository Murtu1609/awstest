
module network {
source = "./network"

cidr     = "10.10.0.0/16"
vpc-name = "newtest"

ssm_region = var.region

subnets = [

  { name = "app", address = "10.10.1.0/24", az = "eu-west-2a"},
  { name = "web", address = "10.10.2.0/24", az = "eu-west-2a"},
   { name = "db", address = "10.10.3.0/24", az = "eu-west-2a"},
  
   ]



security_groups = [
    {name = "app", description = "security group for app"},
    {name = "web", description = "security group for web"},
    {name = "db", description = "security group for db"},
  ]

sg_rules_path = "./sg.csv"


public_subnet = "false"       //true or false 
public_subnet_name = "public-subnet"
public_subnet_cidr = "10.10.4.0/24"
public_subnet_az = "eu-west-2a"

internet_access = "false" 

//endpoints_subnet_cidr = "10.10.10.0/24"
//endpoints_subnet_az = "eu-west-2a"

}



locals {
    instances = csvdecode(file("instances.csv"))
}

module instances {
  for_each = {for object in local.instances: object.name => object }

  source = "./instance"
  
  name = each.key
  ami = var.image_map[each.value.image]
  key_name = each.value.key_name
  instance_type = each.value.instance_type
  security_groups = [for sg in split(",",each.value.sgs) : module.network.security_group_id[sg]]
  subnet = each.value.subnet == "public" ? module.network.public_subnet_id : module.network.subnet_id[each.value.subnet]
  root_disk_size = each.value.root_disk_size
  additional_disks = each.value.additional_disks
  ip = each.value.ip == "na" ? null : each.value.ip
  public-ip = lower(each.value.public-ip)
  
  ostype = each.value.ostype
  user-data = data.template_file.tpl[each.key].rendered
  iam_role = module.iam.role

  tags = {
    Name = each.key
    Project = "testproject"
    role = each.value.role-tag
    platform = each.value.platform-tag
}
}


module iam {
  source = "./iam"
  region = var.region
  role = "test"    //rolename for ec2 instances to access ssm and ec2
  group = "ssmusers"       //groupname for users to access ec2 via ssm
  users = ["ssmtestuser","test1"]
}