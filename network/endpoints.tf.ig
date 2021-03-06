

resource "aws_security_group" "ssm_sg" {
    
    name = "ssm_sg"
    description = "sg for ssm"
    vpc_id = aws_vpc.vpc.id
}

resource "aws_security_group_rule" "ssm_sgrule_inbound_default" {
   
    type = "ingress"
    from_port = 0
    to_port = 0
    protocol = "all"
    source_security_group_id = aws_security_group.ssm_sg.id
    security_group_id = aws_security_group.ssm_sg.id
}

resource "aws_security_group_rule" "ssm_sgrule_inbound" {
   
    type = "ingress"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = [var.cidr]
    security_group_id = aws_security_group.ssm_sg.id
}

resource "aws_security_group_rule" "ssm_sgrule_outbound" {
   
    type = "egress"
    from_port = 0
    to_port = 0
    protocol = "all"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = aws_security_group.ssm_sg.id
}

resource "aws_subnet" "endpoints" {
 

  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.endpoints_subnet_cidr
  availability_zone = var.endpoints_subnet_az

  tags = {
    Name = "endpoints-cidr"
  }
}

resource "aws_vpc_endpoint" "ssm" {
    
  vpc_id            = aws_vpc.vpc.id
  service_name      = "com.amazonaws.${var.ssm_region}.ssm"
  vpc_endpoint_type = "Interface"

  security_group_ids = [
    aws_security_group.ssm_sg.id,
  ]

subnet_ids = [aws_subnet.endpoints.id]
  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "ec2messages" {
     
  vpc_id            = aws_vpc.vpc.id
  service_name      = "com.amazonaws.${var.ssm_region}.ec2messages"
  vpc_endpoint_type = "Interface"

  security_group_ids = [
    aws_security_group.ssm_sg.id,
  ]

subnet_ids = [aws_subnet.endpoints.id]
  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "ssmmessages" {
     
  vpc_id            = aws_vpc.vpc.id
  service_name      = "com.amazonaws.${var.ssm_region}.ssmmessages"
  vpc_endpoint_type = "Interface"

  security_group_ids = [
    aws_security_group.ssm_sg.id,
  ]

subnet_ids = [aws_subnet.endpoints.id]
  private_dns_enabled = true
}


resource "aws_vpc_endpoint" "ec2" {
    
  vpc_id            = aws_vpc.vpc.id
  service_name      = "com.amazonaws.${var.ssm_region}.ec2"
  vpc_endpoint_type = "Interface"

  security_group_ids = [
    aws_security_group.ssm_sg.id,
  ]

subnet_ids = [aws_subnet.endpoints.id]
  private_dns_enabled = true
}