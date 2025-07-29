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

              echo "Instalando nginx e cliente mysql (via mariadb105)..."
              dnf install -y nginx mariadb105

              echo "Habilitando e iniciando nginx..."
              systemctl enable nginx
              systemctl start nginx

              echo "Escrevendo página HTML..."
              echo '<!DOCTYPE html><html><head><meta charset="UTF-8"></head><body><h1>Olá! Servidor provisionado com Terraform 🚀</h1></body></html>' > /usr/share/nginx/html/index.html

              echo "Instalando CloudWatch Agent via link direto do S3..."
              dnf install -y https://s3.amazonaws.com/amazoncloudwatch-agent/amazon_linux/amd64/latest/amazon-cloudwatch-agent.rpm

              echo "Criando configuração padrão para CloudWatch Agent..."
              mkdir -p /opt/aws/amazon-cloudwatch-agent/bin

              cat <<EOC > /opt/aws/amazon-cloudwatch-agent/bin/config.json
              {
                "agent": {
                  "metrics_collection_interval": 60,
                  "logfile": "/opt/aws/amazon-cloudwatch-agent/logs/amazon-cloudwatch-agent.log",
                  "run_as_user": "root"
                },
                "logs": {
                  "logs_collected": {
                    "files": {
                      "collect_list": [
                        {
                          "file_path": "/var/log/user_data.log",
                          "log_group_name": "/ec2/user_data.log",
                          "log_stream_name": "{instance_id}"
                        },
                        {
                          "file_path": "/var/log/messages",
                          "log_group_name": "/ec2/messages",
                          "log_stream_name": "{instance_id}"
                        }
                      ]
                    }
                  }
                }
              }
              EOC

              echo "Iniciando CloudWatch Agent..."
              /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl \
                -a fetch-config \
                -m ec2 \
                -c file:/opt/aws/amazon-cloudwatch-agent/bin/config.json \
                -s

              echo "Finalizado!"
              EOF


  tags = {
    Name = "${var.project}-ec2"
  }
}
