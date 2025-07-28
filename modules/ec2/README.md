# 📦 Módulo `ec2`

Este módulo provisiona uma **instância EC2** configurada com **NGINX** e **cliente MySQL (MariaDB)**, utilizando `user_data` para instalação automática.

---

## 🚀 Recursos Criados

- **EC2 Instance**:
  - Baseada em AMI e tipo parametrizáveis
  - Associada a uma subnet e security group
  - Provisionada com:
    - Atualização de pacotes (`dnf update`)
    - Instalação do NGINX e MariaDB 10.5 (cliente MySQL)
    - Página HTML básica em `/usr/share/nginx/html/index.html`

- **Chave SSH**:
  - Criada automaticamente com `tls_private_key`
  - Armazenada localmente como `.pem`
  - Registrada na AWS com `aws_key_pair`

---

## 📥 Variáveis de Entrada

| Nome                | Tipo   | Descrição                                        |
|---------------------|--------|--------------------------------------------------|
| `project`           | string | Nome do projeto                                  |
| `ami_id`            | string | ID da AMI a ser utilizada                        |
| `instance_type`     | string | Tipo da instância (ex: `t3.micro`)               |
| `subnet_id`         | string | ID da subnet onde a instância será provisionada  |
| `security_group_id` | string | ID do security group associado à instância       |

---

## 📤 Outputs

| Nome          | Descrição                        |
|---------------|----------------------------------|
| `instance_id` | ID da instância criada           |
| `public_ip`   | Endereço IP público da instância |

---

## ✅ Exemplo de Uso

```hcl
module "ec2" {
  source             = "./modules/ec2"
  project            = "cloudboilerplate"
  ami_id             = "ami-0abc1234def56789g"
  instance_type      = "t3.micro"
  subnet_id          = module.vpc.public_subnets_ids[0]
  security_group_id  = module.security_groups.ec2_sg_id
}
