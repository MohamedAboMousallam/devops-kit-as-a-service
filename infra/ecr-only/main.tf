provider "aws" {
  region = "eu-north-1"
}

resource "aws_ecr_repository" "app_repo" {
  name                 = "devops-kit-app"
  image_tag_mutability = "MUTABLE"
  force_delete         = true

  encryption_configuration {
    encryption_type = "AES256"
  }
}
