# Módulo `backend_state`

Este módulo provisiona a infraestrutura necessária para armazenar o **state remoto do Terraform** com segurança e controle de concorrência.

### Recursos criados

- **S3 Bucket**: Armazena o arquivo de estado (`terraform.tfstate`)
  - Versionamento ativado
  - Criptografia com AES-256
- **Tabela DynamoDB**: Gerencia locking do estado, evitando conflitos em execuções simultâneas

### Variáveis de entrada

| Nome             | Tipo   | Descrição                                      |
|------------------|--------|------------------------------------------------|
| `project`        | string | Nome do projeto base (usado para nomear os recursos) |
| `bucket_name`    | string | Nome do bucket S3                              |
| `dynamodb_table` | string | Nome da tabela DynamoDB                        |

### Outputs

| Nome            | Descrição                          |
|------------------|-------------------------------------|
| `s3_bucket`     | Nome do bucket S3 criado            |
| `dynamodb_table`| Nome da tabela DynamoDB criada      |

### Exemplo de uso

```hcl
module "backend_state" {
  source         = "./modules/backend_state"
  project        = "cloudboilerplate"
  bucket_name    = "cloud.boiler.plate-terraform-state"
  dynamodb_table = "cloudboilerplate-lock"
}
