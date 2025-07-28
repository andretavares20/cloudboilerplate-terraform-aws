variable "rds_identifier" {}
variable "db_name" {}
variable "db_username" {}
variable "db_password" {}
variable "db_instance_class" {}
variable "allocated_storage" {}
variable "engine_version" {}
variable "subnet_ids" {}
variable "vpc_security_group_ids" {
  type = list(string)
}
