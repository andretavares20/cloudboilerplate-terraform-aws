
---

## ✅ `modules/ec2/README.md`

```markdown
# Módulo `ec2`

Este módulo provisiona uma **instância EC2** configurada com **NGINX** e **cliente MySQL (MariaDB)**, utilizando `user_data` para instalação automática.

### Recursos criados

- **EC2 Instance**:
  - Baseada em AMI e tipo parametrizáveis
  - Associada a uma subnet e security group
  - Com `user_data` para:
    - Atualização de pacotes
    - Instalação de NGINX e MariaDB 10.5
    - Página HTML padrão

- **Chave SSH**:
  - Criada automaticamente com `tls_private_key`
  - Armazenada localmente como `.pem` (segura e reutilizável)
  - Registrada na AWS com `aws_key_pair`

### Variáveis de entrada

| Nome                | Tipo   | Descrição                                        |
|---------------------|--------|--------------------------------------------------|
| `project`           | string | Nome do projeto                                 |
| `ami_id`            | string | ID da AMI a ser utilizada                       |
| `instance_type`     | string | Tipo da instância (ex: `t3.micro`)              |
| `subnet_id`         | string | ID da subnet onde a instância será provisionada |
| `security_group_id` | string | ID do security group associado à instância      |

### Outputs

| Nome          | Descrição                        |
|---------------|-----------------------------------|
| `instance_id` | ID da instância criada           |
| `public_ip`   | Endereço IP público da instância |

### Exemplo de uso

```hcl
module "ec2" {
  source             = "./modules/ec2"
  project            = "cloudboilerplate"
  ami_id             = "ami-0abc1234def56789g"
  instance_type      = "t3.micro"
  subnet_id          = module.vpc.public_subnets_ids[0]
  security_group_id  = module.security_groups.ec2_sg_id
}
