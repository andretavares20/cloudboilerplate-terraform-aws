# terraform {
#   backend "s3" {
#     bucket         = "cloud.boiler.plate-terraform-state"   # Nome do bucket no S3 (precisa existir)
#     key            = "dev/terraform.tfstate"               # Caminho do arquivo dentro do bucket
#     region         = "us-east-1"                           # Região do bucket
#     encrypt        = true                                  # Criptografa o state
#     use_lockfile = true
#   }
# }