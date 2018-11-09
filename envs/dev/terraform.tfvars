aws_region = "us-west-2"
project_name = "tf_storage"
vpc_cidr = "10.123.0.0/16"
public_cidrs = [
    "10.123.1.0/24",
    "10.123.2.0/24"
    ]
accessip = "0.0.0.0/0"
db_cidrs = [
    "10.123.3.0/24",
    "10.123.4.0/24"
    ]
key_name = "pub_key" 
public_key_path = "/Users/jesusgomez/keys/terraform/tf_key.pub"
server_instance_type = "t2.micro" 
#instance_count = 2

#-----RDS-------

rds_instance_class = "db.t2.small"
rds_backup_period = "30"