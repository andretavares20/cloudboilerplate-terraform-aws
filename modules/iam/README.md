# Módulo `iam`

Este módulo cria recursos relacionados ao IAM para uso com instâncias EC2:

## Recursos criados

- **IAM Role** com política `AmazonEC2ReadOnlyAccess`
- **Instance Profile** vinculado à role para uso com EC2

## Variáveis

| Nome      | Tipo   | Descrição                       |
|-----------|--------|---------------------------------|
| `project` | string | Nome do projeto (prefixo usado) |

## Outputs

| Nome                  | Descrição                            |
|-----------------------|---------------------------------------|
| `instance_profile_name` | Nome do instance profile para EC2 |

## Exemplo de uso

```hcl
module "iam" {
  source  = "./modules/iam"
  project = "cloudboilerplate"
}
