# Definition du provider AWS avec la region et les cles d'acces
provider "aws" {
 region = var.region
 access_key = var.access_key
 secret_key = var.secret_key
}

# Création d'une instance EC2
resource "aws_instance" "app_server" {
  ami           = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = [
    aws_security_group.ingress_all.id,
    aws_security_group.egress_all.id
  ]
  tags = {
    Name = "moninstancerapide"
  }
}

# Creation d'un bucket s3 pour le backend Terraform
resource "aws_s3_bucket" "backend_bucket" {
 bucket = var.bucket_name
 
 # Activation du versioning du bucket
 versioning {
    enabled = true
 }
 #Configuration du lifecycle pour eviter la suppression accidentelle
 lifecycle {
    prevent_destroy = true
 }
 #Tag d'identifaction du bucket
 tags = {
    Name = "backend_bucket"
 }
}

#Création du groupe de securité pour les flux entrants
resource "aws_security_group" "ingress_all" {
 name        = "ingress_all"
 description = "Allow all ingress traffic"
 vpc_id      = aws_vpc.main.id
 
 #Règle permetant tout le trafic entrant (à redéfinir pour la sécurité)
 ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks      = [aws_vpc.main.cidr_block]
    ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]

 }

 tags = {
    Name = "ingress_all"
 }
}

#Création du groupe de securité pour les flux sortants
resource "aws_security_group" "egress_all" {
 name        = "egress_all"
 description = "Allow all egress traffic"

 #Règle permetant tout le trafic sortants (à redéfinir pour la sécurité)
 egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]

 }

 tags = {
    Name = "egress_all"
 }
}

#Configuration de terraform
terraform {
 required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.31.0"
    }
 }

 #Configuration du backend S3 pour stocker l'etat de terraform
 backend "s3" {
    bucket = "monbuckets3"
    key    = "tfstate/monbuckets3.tfstate"
    region = "eu-west-3"
 }
}
