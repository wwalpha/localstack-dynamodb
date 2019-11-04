# -------------------------------------------------------------------------------------------
# AWS Provider
# -------------------------------------------------------------------------------------------
provider "aws" {}

# -------------------------------------------------------------------------------------------
# Terraform Settings
# -------------------------------------------------------------------------------------------
terraform {
  required_version = ">= 0.12"
}

# -------------------------------------------------------------------------------------------
# AWS VPC
# -------------------------------------------------------------------------------------------
module "vpc" {
  source         = "terraform-aws-modules/vpc/aws"
  name           = "DynamodbTest"
  azs            = ["ap-northeast-1a", "ap-northeast-1c"]
  cidr           = "10.10.0.0/16"
  public_subnets = ["10.10.0.0/24"]
}
# -------------------------------------------------------------------------------------------
# AWS Security Group
# -------------------------------------------------------------------------------------------
module "sg" {
  source                  = "github.com/wwalpha/terraform-module-security-group"
  name                    = "DynamodbSG"
  vpc_id                  = "${module.vpc.vpc_id}"
  enable_ingress_from_any = true
  enable_egress_to_any    = true
}


data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

data "template_file" "task" {
  template = "${file("${path.module}/task_definition.tpl")}"
  vars = {
    account_id = "${data.aws_caller_identity.current.account_id}"
    region     = "${data.aws_region.current.name}"
  }
}

# -------------------------------------------------------------------------------------------
# AWS ECS
# -------------------------------------------------------------------------------------------
module "ecs" {
  source                           = "github.com/wwalpha/terraform-module-ecs"
  cluster_name                     = "DynamodbTesterCluster"
  task_family                      = "DynamodbTesterTask"
  task_container_definitions_json  = "${data.template_file.task.rendered}"
  service_name                     = "DynamodbTesterService"
  service_network_subnets          = "${module.vpc.public_subnets}"
  service_network_security_groups  = ["${module.sg.id}"]
  service_network_assign_public_ip = true
  service_desired_count            = 0
}
