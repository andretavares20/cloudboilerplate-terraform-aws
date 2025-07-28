project        = "cloudboilerplate"
vpc_cidr       = "10.0.0.0/16"
public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets = ["10.0.101.0/24", "10.0.102.0/24"]
azs            = ["us-east-1a", "us-east-1b"]
ami_id   = "ami-08a6efd148b1f7504" # Amazon Linux 2 - Free Tier
key_name = "sua-chave-ssh"         # Substitua pelo nome do seu par de chaves
