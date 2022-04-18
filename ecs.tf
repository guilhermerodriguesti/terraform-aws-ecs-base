

resource "aws_ecs_cluster" "ecs_cluster" {
  name = "${var.cluster_name}-${var.app_env}"
}

data "template_file" "task_definition_template" {
  template = file("task_definition.json.tpl")
  vars = {
    REPOSITORY_URL = replace(aws_ecr_repository.ecr_repository.repository_url, "https://", "")
  }
}

resource "aws_ecs_task_definition" "ecs_task_definition" {
  family                = "${var.app_name}-${var.app_env}"
  container_definitions = data.template_file.task_definition_template.rendered
}

resource "aws_ecs_service" "ecs_service" {
  name            = "${var.app_name}-${var.app_env}"
  cluster         = aws_ecs_cluster.ecs_cluster.id
  task_definition = aws_ecs_task_definition.ecs_task_definition.arn
  desired_count   = 2
}
