# 🛡️ AWS Secure Infrastructure Pipeline

![Status](https://img.shields.io/badge/Security-Hardened-green) ![Terraform](https://img.shields.io/badge/IaC-Terraform-purple)

Projeto de demonstração de **DevSecOps** focado em segurança de infraestrutura (IaC).
Este repositório implementa um pipeline que audita e bloqueia automaticamente configurações inseguras na AWS antes que elas cheguem à produção.

## 🛠 Tecnologias
- **Terraform:** Provisionamento de Infraestrutura como Código.
- **GitHub Actions:** Automação de CI/CD.
- **Tfsec:** Análise estática de segurança (SAST) para Terraform.
- **AWS S3:** Objeto de estudo (Armazenamento Seguro).

## ⚙️ O Fluxo de Segurança
1. **Coding:** O desenvolvedor escreve o código da infraestrutura.
2. **Push:** O código é enviado ao repositório.
3. **Automated Scan:** O GitHub Actions dispara o **Tfsec**.
4. **Guardrail:**
    - ❌ Se houver falhas críticas (ex: Bucket Público), o pipeline falha.
    - ✅ Se estiver seguro (Criptografado, Privado), o pipeline aprova.

## 🔒 Controles Implementados
- [x] Bloqueio total de acesso público ao S3.
- [x] Enforce de Criptografia (AES-256).
- [x] Versionamento de arquivos ativado.
- [x] Gestão de falsos positivos via comentários de código.


```

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_s3_bucket.meu_balde_secreto](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_acl.example](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl) | resource |
| [aws_s3_bucket_ownership_controls.example](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_ownership_controls) | resource |
| [aws_s3_bucket_public_access_block.block_public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.encryption](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_bucket_versioning.versioning](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->