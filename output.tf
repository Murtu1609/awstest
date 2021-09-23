output "test" {
    value = "sample terraform output"
}


output "vpc_id" {
  value = module.network.vpc_id
}

output "subnet_id" {
    value = module.network.subnet_id
}

output "public_subnet_id" {
    value = module.network.public_subnet_id
}

output "security_group_id" {
     value = module.network.security_group_id
}