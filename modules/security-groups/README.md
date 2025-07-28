# 🔐 Módulo `security-groups`

Este módulo provisiona dois **Security Groups**:

- Um para acesso público à instância EC2 via SSH e HTTP
- Um para acesso interno da EC2 ao RDS via porta 3306

---

## 🚀 Recursos Criados

### 🔓 `ec2_sg` (Security Group para EC2)

- Permite:
  - Acesso SSH (`porta 22`) de qualquer IP
  - Acesso HTTP (`porta 80`) de qualquer IP
- Saída (egress) totalmente liberada

### 🛡️ `rds_sg` (Security Group para RDS)

- Permite:
  - Acesso à porta `3306` apenas a partir do `ec2_sg`
- Saída (egress) totalmente liberada

---

## 📥 Variáveis de Entrada

| Nome      | Tipo   | Descrição                               |
|-----------|--------|-------------------------------------------|
| `vpc_id`  | string | ID da VPC onde os Security Groups serão criados |

---

## 📤 Outputs

| Nome        | Descrição                             |
|-------------|-----------------------------------------|
| `ec2_sg_id` | ID do Security Group associado à EC2   |
| `rds_sg_id` | ID do Security Group associado ao RDS  |

---

## ✅ Exemplo de Uso

```hcl
module "security_groups" {
  source  = "./modules/security-groups"
  vpc_id  = module.vpc.vpc_id
}
