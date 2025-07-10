resource "aws_ecr_repository" "app_repo" {
  name                 = "devops-kit-app"
  image_tag_mutability = "MUTABLE"
  force_delete         = true

  encryption_configuration {
    encryption_type = "AES256"
  }

  tags = {
    Name    = "devops-kit-app"
    Project = "devops-kit"
  }
}

output "ecr_repo_url" {
  value = aws_ecr_repository.app_repo.repository_url
}
