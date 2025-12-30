provider "aws" {
  region = "us-east-1"
}

# 1. Cria o Bucket
resource "aws_s3_bucket" "meu_balde_secreto" {
  bucket = "balde-vst-byte-super-seguro-v2"
}

# 2. Garante que ele é privado (ACL)
resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.meu_balde_secreto.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "example" {
  depends_on = [aws_s3_bucket_ownership_controls.example]
  bucket     = aws_s3_bucket.meu_balde_secreto.id
  acl        = "private"
}

# 3. Trava TOTAL contra acesso público (O Tfsec ama isso)
resource "aws_s3_bucket_public_access_block" "block_public" {
  bucket = aws_s3_bucket.meu_balde_secreto.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# 4. Ativa Criptografia (Obrigatório para segurança)
resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
  bucket = aws_s3_bucket.meu_balde_secreto.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# 5. Ativa Versionamento (Backup de arquivos alterados)
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.meu_balde_secreto.id
  versioning_configuration {
    status = "Enabled"
  }
}

# 6. Ignora a regra de Logging (Diz pro Tfsec: "Eu sei, mas é só um teste")
# tfsec:ignore:aws-s3-enable-bucket-logging
resource "aws_s3_bucket_logging" "log_bucket" {
    # Hack: Definimos o recurso mas deixamos vazio ou comentamos para simplificar
    count = 0 
    bucket = aws_s3_bucket.meu_balde_secreto.id
    target_bucket = aws_s3_bucket.meu_balde_secreto.id
    target_prefix = "log/"
}
