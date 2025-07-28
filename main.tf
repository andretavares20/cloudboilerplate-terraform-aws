terraform {
    required_version = "1.12.2"

    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "6.5.0"
      }
    }
    
     
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "my-test-bucket"{
  bucket = "cloud.boiler.plate-terraform-state"

  tags = {
    Name = "My bucket"
    Environment = "Dev"
    ManagedBy = "Terraform"
  }
}

resource "aws_s3_bucket_ownership_controls" "this" {
  bucket = aws_s3_bucket.my-test-bucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "this" {
  bucket     = aws_s3_bucket.my-test-bucket.id
  acl        = "private"
  depends_on = [aws_s3_bucket_ownership_controls.this]
}

module "vpc" {
  source          = "./modules/vpc"
  project         = "cloudboilerplate"
  vpc_cidr        = var.vpc_cidr
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  azs             = var.azs
}

module "ec2" {
  source             = "./modules/ec2"
  project            = var.project
  ami_id             = var.ami_id
  instance_type      = "t3.micro"
  subnet_id = module.vpc.public_subnets_ids[0]
  security_group_id  = module.security_groups.ec2_sg_id
}

output "ec2_public_ip" {
  description = "Endereço IP público da instância EC2"
  value       = module.ec2.public_ip
}

module "s3" {
  source  = "./modules/s3"
  project = var.project
}

module "rds" {
  source = "./modules/rds"

  rds_identifier         = "cloudboilerplate-db"
  db_name                = "cloudboilerplate"
  db_username            = "admin"
  db_password            = "terraform123" # para estudos apenas
  db_instance_class      = "db.t3.micro"
  allocated_storage      = 20
  engine_version         = "8.0.35"
  subnet_ids = module.vpc.public_subnets_ids
  vpc_security_group_ids = [module.security_groups.rds_sg_id]
}

module "security_groups" {
  source = "./modules/security-groups"
  vpc_id = module.vpc.vpc_id
}
