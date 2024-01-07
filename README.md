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

1. Cloner le dépôt : git clone https://github.com/raphaelbrg/terraform.git

2. Modifier les variables d'accès AWS dans le fichier `terraform.tfvars`.

3. Initialiser Terraform : terraform init

4. Vérifier les changements que Terraform va appliquer : terraform plan

5. Appliquer les changements : terraform apply

6. Pour terminer et détruire l'instance : terraform detroy

## Avertissement

- Assurez-vous de comprendre les coûts associés à ces ressources AWS avant de les déployer.
- Les clés d'accès AWS (access_key et secret_key) ne doivent pas être stockées dans le code public. Utilisez des variables d'environnement ou des mécanismes sécurisés pour les fournir.
- L'instance est actuellement ouverte sur tous les ports entrants, vous pouvez réduire les accès comme ceci :
```
ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks      = [aws_vpc.main.cidr_block]
    ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
}
```

## Auteurs

- Raphaël - Développeur principal
