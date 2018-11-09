provider "aws" {
  region  = "${var.aws_region}"
  profile = "mine"
}

terraform {
  backend "s3" {
    bucket         = "tf-remote-state-bucket-demo-aws-modules-jesus"
    key            = "envs/dev/terraform.tfstate"
    dynamodb_table = "terraform-state-lock-dynamo-modules-jesus"
    region         = "us-east-1"
  }
}

## Deploy Storage Resource --------------------------------------------------
module "storage" {
  source       = "../../modules/storage"
  project_name = "${var.project_name}"
}

## Deploy Networking Resources --------------------------------------------------

module "networking" {
  source       = "../../modules/networking"
  vpc_cidr     = "${var.vpc_cidr}"
  public_cidrs = "${var.public_cidrs}"
  db_cidrs     = "${var.db_cidrs}"
  accessip     = "${var.accessip}"

  #lb_instances  = "${module.application.web_instances}"
}

## Deploy Application Resources --------------------------------------------------

module "application" {
  source = "../../modules/application"

  #instance_count  = "${var.instance_count}"
  key_name        = "${var.key_name}"
  public_key_path = "${var.public_key_path}"
  instance_type   = "${var.server_instance_type}"
  subnets         = "${module.networking.public_subnets}"
  security_group  = "${module.networking.public_sg}"
  subnet_ips      = "${module.networking.subnet_ips}"
  elb_sg          = "${module.networking.elb_sg}"
}

## DB instances --------------------------------------------------

module "database" {
  source = "../../modules/database"

  instance_class   = "${var.rds_instance_class}"
  db_subnets       = "${module.networking.db_subnets}"
  retention_period = "${var.rds_backup_period}"

  #instance_count  = "${var.instance_count}"

  ## DB instances
}
