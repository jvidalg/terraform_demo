variable "aws_region" {}

#------ storage variables

variable "project_name" {}

#-------networking variables

variable "vpc_cidr" {}

variable "public_cidrs" {
  type = "list"
}

variable "db_cidrs" {
  type = "list"
}

variable "accessip" {}

#-------application variables

variable "key_name" {}

variable "public_key_path" {}

variable "server_instance_type" {}

variable "instance_count" {
  default = 1
}

variable "rds_instance_class" {}

variable "rds_backup_period" {}
