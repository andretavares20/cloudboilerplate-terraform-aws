# ☁️ CloudBoilerplate com Terraform + AWS

Infraestrutura modular provisionada com Terraform, utilizando recursos gratuitos da AWS sempre que possível. Ideal para **estudos de DevOps**, **back-end cloud-ready** e **infraestrutura como código (IaC)**.

---

## 📦 Módulos utilizados

Este projeto é dividido em módulos reutilizáveis para cada recurso:

| Módulo             | Descrição                                                                 |
|--------------------|---------------------------------------------------------------------------|
| `vpc`              | Cria VPC, subnets públicas/privadas, NAT e roteamento                     |
| `ec2`              | Instância EC2 com NGINX + MySQL client (MariaDB), via `user_data`         |
| `rds`              | Banco MySQL (Amazon RDS) com subnet group e SG dedicado                   |
| `s3`               | Bucket S3 privado com política de acesso bloqueando acesso público        |
| `security-groups`  | Security Groups para EC2 (SSH/HTTP) e RDS (liberando para EC2 apenas)     |

---

## 🌐 Backend do Terraform (comentado para primeiro uso)

```hcl
# terraform {
#   backend "s3" {
#     bucket         = "cloud.boiler.plate-terraform-state"
#     key            = "dev/terraform.tfstate"
#     region         = "us-east-1"
#     encrypt        = true
#     use_lockfile   = true
#   }
# }
