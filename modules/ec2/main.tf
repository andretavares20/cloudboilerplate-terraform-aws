resource "aws_instance" "this" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]
  key_name               = aws_key_pair.this.key_name
  iam_instance_profile = var.iam_instance_profile

  user_data = <<-EOF
              #!/bin/bash
              exec > /var/log/user_data.log 2>&1

              echo "Atualizando pacotes..."
              dnf update -y

              echo "Instalando nginx e klient mysql (via mariadb105)..."
              dnf install -y nginx mariadb105

              echo "Habilitando e iniciando nginx..."
              systemctl enable nginx
              systemctl start nginx

              echo "Instalando cliente MySQL..."
              # mariadb105 já fornece o cliente 'mysql'

              echo "Escrevendo página HTML..."
              echo '<!DOCTYPE html><html><head><meta charset="UTF-8"></head><body><h1>Olá! Servidor provisionado com Terraform 🚀</h1></body></html>' > /usr/share/nginx/html/index.html

              echo "Finalizado!"
              EOF


  tags = {
    Name = "${var.project}-ec2"
  }
}
