# 🌐 Módulo `vpc`

Este módulo cria a infraestrutura de rede básica da AWS, incluindo:

- VPC
- Subnets públicas e privadas
- Gateway de internet
- NAT Gateway
- Tabelas de rotas

---

## 🚀 Recursos Criados

- **VPC** com DNS habilitado
- **Subnets Públicas** com IP público automático
- **Subnets Privadas** isoladas da internet pública
- **Internet Gateway** para acesso externo
- **NAT Gateway** para acesso à internet das subnets privadas
- **Route Tables** para tráfego externo

---

## 📥 Variáveis de Entrada

| Nome              | Tipo          | Descrição                                    |
|-------------------|---------------|----------------------------------------------|
| `project`         | string        | Nome base do projeto                         |
| `vpc_cidr`        | string        | CIDR principal da VPC                        |
| `public_subnets`  | list(string)  | Lista de CIDRs para subnets públicas         |
| `private_subnets` | list(string)  | Lista de CIDRs para subnets privadas         |
| `azs`             | list(string)  | Lista de Zonas de Disponibilidade da região  |

---

## 📤 Outputs

| Nome                  | Descrição                                |
|------------------------|--------------------------------------------|
| `vpc_id`              | ID da VPC criada                          |
| `public_subnets_ids`  | Lista de IDs das subnets públicas         |
| `private_subnets_ids` | Lista de IDs das subnets privadas         |
| `nat_eip_id`          | ID do Elastic IP associado ao NAT Gateway |

---

## ✅ Exemplo de Uso

```hcl
module "vpc" {
  source           = "./modules/vpc"
  project          = "cloudboilerplate"
  vpc_cidr         = "10.0.0.0/16"
  public_subnets   = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets  = ["10.0.3.0/24", "10.0.4.0/24"]
  azs              = ["us-east-1a", "us-east-1b"]
}
