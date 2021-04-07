provider "aws" {
  profile = var.profile
  region     = var.aws_region
}
provider "helm" {
  version = "~> 2.0.0"
  kubernetes {
    config_path    = "~/.kube/config"
    config_context = "name_of_kube_comtext"
  }
}

provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "name_of_kube_comtext"
}

terraform {
  backend "s3" {
    bucket     = "bucket_name"
    key        = "bucket_key"
    region     = "bucket_region"
    access_key = "access_key"
    secret_key = "secret_key"
  }
}
