variable "project" {
  type        = string
  description = "Nome do projeto base"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR da VPC"
}

variable "public_subnets" {
  type        = list(string)
  description = "Lista de subnets públicas"
}

variable "azs" {
  type        = list(string)
  description = "Zonas de disponibilidade"
}

variable "private_subnets" {
  description = "Lista de subnets privadas"
  type        = list(string)
}
