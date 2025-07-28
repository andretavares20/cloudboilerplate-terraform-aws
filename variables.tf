variable "project" {
  description = "Nome do projeto para tags ou recursos"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block da VPC"
  type        = string
}

variable "public_subnets" {
  description = "Lista de subnets públicas"
  type        = list(string)
}

variable "private_subnets" {
  description = "Lista de subnets privadas"
  type        = list(string)
}

variable "azs" {
  description = "Availability Zones usadas"
  type        = list(string)
}

variable "ami_id" {
  description = "ID da AMI usada para EC2"
  type        = string
}

variable "key_name" {
  description = "Nome do par de chaves EC2"
  type        = string
}

