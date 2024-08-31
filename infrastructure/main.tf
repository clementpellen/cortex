provider "aws" {
  region = "eu-west-1"
}

# Get the public IP address of the machine running Terraform
data "http" "icanhazip" {
  url = "http://icanhazip.com"
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "cortex-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  private_subnets = ["10.0.1.0/24"]
  public_subnets  = ["10.0.101.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  default_security_group_ingress = [
    {
      description = "Allow SSH from the client IP"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = "${chomp(data.http.icanhazip.body)}/32"
    }
  ]

  tags = {
    Project-Name = "cortex"
    Terraform    = "true"
  }
}

resource "aws_key_pair" "cortex-key" {
  key_name   = "cortex-key"
  public_key = file("~/.ssh/cortex-key.pub")

  tags = {
    Project-Name = "cortex"
    Terraform    = "true"
  }
}

module "ec2_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "cortex-ec2"

  instance_type               = "g3s.xlarge"
  key_name                    = aws_key_pair.cortex-key.key_name
  monitoring                  = true
  vpc_security_group_ids      = [module.vpc.default_security_group_id]
  subnet_id                   = module.vpc.public_subnets[0]
  associate_public_ip_address = true

  root_block_device = [
    {
      volume_size           = 60
      volume_type           = "gp3"
      delete_on_termination = true
    }
  ]

  tags = {
    Project-Name = "cortex"
    Terraform    = "true"
  }
}

output "ec2_adress" {
  value = module.ec2_instance.public_ip
}
