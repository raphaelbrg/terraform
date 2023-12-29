# Projet Terraform pour AWS

Ce projet contient des fichiers de configuration Terraform pour créer un ensemble de ressources AWS, comprenant un VPC, une instance, un groupe de sécurité et un bucket S3 pour le backend de Terraform.

## Configuration

### Structure des fichiers

- main.tf : Contient la définition des ressources AWS telles que le bucket S3, les groupes de sécurité, etc.
- variables.tf : Définit les variables utilisées dans le code Terraform.
- terraform.tfvars : Contient les clés d'accès.
  
### Prérequis

- Terraform doit être installé localement.
- Des clés d'accès AWS (access_key et secret_key) doivent être fournies et mises dans un fichier terrafrom.tfvars.

## Utilisation

1. Cloner le dépôt : git clone https://github.com/raphaelbrg/terraform/new.git

2. Modifier les variables d'accès AWS dans le fichier `variables.tf`.

3. Initialiser Terraform : terraform init

4. Vérifier les changements que Terraform va appliquer : terraform plan

5. Appliquer les changements : terraform apply
