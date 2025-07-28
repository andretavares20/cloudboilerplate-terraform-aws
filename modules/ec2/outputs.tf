output "instance_id" {
  value = aws_instance.this.id
}

output "public_ip" {
  description = "Endereço IP público da instância EC2"
  value       = aws_instance.this.public_ip
}