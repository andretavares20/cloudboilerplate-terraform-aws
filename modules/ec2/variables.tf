variable "project" {
  type        = string
  description = "Nome do projeto"
}

variable "ami_id" {
  type        = string
  description = "ID da AMI para a instância"
}

variable "instance_type" {
  type        = string
  default     = "t3.micro"
}

variable "subnet_id" {
  type        = string
  description = "ID da subnet onde a instância será criada"
}

variable "security_group_id" {
  type        = string
  description = "ID do Security Group"
}
