output "endpoint" {
  description = "Endpoint da instância RDS"
  value       = aws_db_instance.this.endpoint
}

output "port" {
  description = "Porta da instância RDS"
  value       = aws_db_instance.this.port
}
