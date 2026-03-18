terraform {
  required_version = ">= 1.5.0"
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.1.1"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}

module "db" {
  source  = "terraform-aws-modules/rds/aws"
  version = var.rds_version

  identifier = "demodb"

  engine            = "mysql"
  engine_version    = "8.0.32"
  instance_class    = "db.t3.large"
  allocated_storage = 5

  db_name  = "demodb"
  username = "user"
  port     = "3306"
}
