# 📦 Módulo `s3`

Este módulo provisiona um **bucket S3 privado** com bloqueio de acesso público e tags padronizadas para o projeto.

---

## 🚀 Recursos Criados

- **S3 Bucket**:
  - Nome baseado no prefixo do projeto (`<project>-bucket`)
  - `force_destroy = true` (permite destruição mesmo com objetos dentro)
  - Tags automáticas de identificação

- **Restrição de Acesso Público**:
  - `block_public_acls = true`
  - `block_public_policy = true`
  - `ignore_public_acls = true`
  - `restrict_public_buckets = true`

---

## 📥 Variáveis de Entrada

| Nome       | Tipo   | Descrição                           |
|------------|--------|-------------------------------------|
| `project`  | string | Nome do projeto usado como prefixo  |

---

## 📤 Outputs

| Nome         | Descrição                  |
|--------------|----------------------------|
| `bucket_name`| Nome do bucket S3 criado   |

---

## ✅ Exemplo de Uso

```hcl
module "s3" {
  source  = "./modules/s3"
  project = "cloudboilerplate"
}
