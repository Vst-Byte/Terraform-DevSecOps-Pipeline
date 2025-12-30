main.tf

# Configura o "provedor" (quem vai criar a infraestrutura: AWS)
provider "aws" {
  region = "us-east-1"
}

# Cria um Balde S3 (como se fosse uma pasta no Google Drive)
resource "aws_s3_bucket" "meu_balde_secreto" {
  bucket = "balde-vst-byte-teste-123" # O nome tem que ser único no mundo todo

  # 🛑 O ERRO ESTÁ AQUI EMBAIXO!
  # "public-read" deixa qualquer pessoa na internet ler seus arquivos.
  acl    = "private"
}
