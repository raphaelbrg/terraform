#Variables du code Terraform

variable "access_key" {
 description = "AWS access key"
 type        = string
}

variable "secret_key" {
 description = "AWS secret key"
 type        = string
}

variable "region" {
 description = "AWS region"
 type        = string
 default     = "eu-west-3"
}

variable "bucket_name" {
 description = "Bucket name for the backend"
 type        = string
 default     = "monbucketrapide"
}

variable "key_name" {
 description = "Key name for the backend"
 type        = string
 default     = "tfstate/monbucketrapide.tfstate"
}

variable "ami" {
    type = string
    default = "ami-02ea01341a2884771"
}

variable "instance_type" {
    type = string
    default = "t2.micro"
}