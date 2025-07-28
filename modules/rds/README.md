# 📦 Módulo `rds`

Este módulo do Terraform provisiona uma instância do Amazon RDS com MySQL, incluindo a criação de um grupo de sub-redes (subnet group) para alta disponibilidade.

---

## 🔧 Recursos Criados

- `aws_db_instance`: Instância RDS com MySQL.
- `aws_db_subnet_group`: Grupo de sub-redes onde a RDS será provisionada.

---

## 📥 Variáveis

| Nome                   | Tipo          | Descrição                                                                 |
|------------------------|---------------|---------------------------------------------------------------------------|
| `rds_identifier`       | `string`      | Identificador único da instância RDS.                                     |
| `db_name`              | `string`      | Nome do banco de dados a ser criado.                                      |
| `db_username`          | `string`      | Nome de usuário principal do banco de dados.                              |
| `db_password`          | `string`      | Senha do usuário principal.                                               |
| `db_instance_class`    | `string`      | Tipo de instância (ex: `db.t3.micro`).                                    |
| `allocated_storage`    | `number`      | Armazenamento alocado em GB.                                              |
| `engine_version`       | `string`      | Versão do MySQL (ex: `8.0.35`).                                           |
| `subnet_ids`           | `list(string)`| Lista de IDs das subnets para o RDS.                                      |
| `vpc_security_group_ids`| `list(string)`| Lista de security groups associados à instância.                          |

---

## 📤 Outputs

| Nome       | Descrição                             |
|------------|----------------------------------------|
| `endpoint` | Endpoint da instância RDS.             |
| `port`     | Porta da instância RDS (default: 3306) |

---

## ✅ Exemplo de uso

```hcl
module "rds" {
  source                 = "./modules/rds"
  rds_identifier         = "cloudboilerplate-db"
  db_name                = "meubanco"
  db_username            = "admin"
  db_password            = "senha123"
  db_instance_class      = "db.t3.micro"
  allocated_storage      = 20
  engine_version         = "8.0.35"
  subnet_ids             = [module.vpc.private_subnet_1_id, module.vpc.private_subnet_2_id]
  vpc_security_group_ids = [module.vpc.default_sg_id]
}
