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
