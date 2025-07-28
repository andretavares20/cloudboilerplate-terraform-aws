variable "project" {
  type        = string
  description = "Nome do projeto base"
}

variable "bucket_name" {
  type        = string
  description = "Nome do bucket S3 para o state"
}

variable "dynamodb_table" {
  type        = string
  description = "Nome da tabela DynamoDB para locking"
}
