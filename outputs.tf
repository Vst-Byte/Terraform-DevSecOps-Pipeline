output "nome_do_bucket" {
  description = "balde-vst-byte-super-seguro-v2"
  value       = aws_s3_bucket.meu_balde_secreto.id
}