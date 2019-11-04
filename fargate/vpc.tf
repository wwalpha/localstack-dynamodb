module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  azs            = ["ap-northeast-1a", "ap-northeast-1c", "ap-northeast-1d"]
  name           = "localstack-dynamodb"
  cidr           = "10.10.0.0/16"
  public_subnets = ["10.10.0.0/24"]
}
