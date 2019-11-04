locals {
  region = "${data.aws_region.this.name}"
  # task_definition = "${aws_ecs_task_definition.this.family}:${aws_ecs_task_definition.this.revision}"
}

data "aws_region" "this" {}

