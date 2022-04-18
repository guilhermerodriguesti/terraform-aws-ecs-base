
resource "aws_ecr_repository" "ecr_repository" {
  name = "${var.app_name}-base"
}

resource "null_resource" "docker_build" {
  triggers = {
    app_md5 = filemd5("dockerfiles/Dockerfile_build")
  }
  provisioner "local-exec" {
    working_dir = "."
    command     = "$(aws ecr get-login --no-include-email --region ${var.region})"
  }

  provisioner "local-exec" {
    working_dir = "."
    command     = "docker build -f dockerfiles/Dockerfile_build -t ${var.app_name} ."
  }

  provisioner "local-exec" {
    working_dir = "."
    command     = "docker tag ${var.app_name}:latest ${aws_ecr_repository.ecr_repository.repository_url}:${var.tag-build}"
  }

  provisioner "local-exec" {
    working_dir = "."
    command     = "docker push ${aws_ecr_repository.ecr_repository.repository_url}:${var.tag-build}"
  }
  
  provisioner "local-exec" {
    working_dir = "."
    command     = "docker push ${aws_ecr_repository.ecr_repository.repository_url}:${var.tag-build}"
  }
}

resource "null_resource" "docker_runtime" {
  triggers = {
    app_md5 = filemd5("dockerfiles/Dockerfile_runtime")
  }
  provisioner "local-exec" {
    working_dir = "."
    command     = "$(aws ecr get-login --no-include-email --region ${var.region})"
  }

  provisioner "local-exec" {
    working_dir = "."
    command     = "docker build -f dockerfiles/Dockerfile_runtime -t ${var.app_name} ."
  }

  provisioner "local-exec" {
    working_dir = "."
    command     = "docker tag ${var.app_name}:latest ${aws_ecr_repository.ecr_repository.repository_url}:${var.tag-runtime}"
  }

  provisioner "local-exec" {
    working_dir = "."
    command     = "docker push ${aws_ecr_repository.ecr_repository.repository_url}:${var.tag-runtime}"
  }
  
  provisioner "local-exec" {
    working_dir = "."
    command     = "docker push ${aws_ecr_repository.ecr_repository.repository_url}:${var.tag-runtime}"
  }
}
