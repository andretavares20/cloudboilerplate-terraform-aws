variable "project" {
  description = "Nome do projeto (prefixo nos recursos)"
  type        = string
}

variable "vpc_id" {
  description = "ID da VPC onde o ALB será provisionado"
  type        = string
}

variable "public_subnets" {
  description = "Lista de subnets públicas para o ALB"
  type        = list(string)
}

variable "alb_security_group" {
  description = "Security group ID para o ALB"
  type        = string
}

variable "instance_id" {
  description = "ID da instância EC2 para anexar ao Target Group"
  type        = string
}
