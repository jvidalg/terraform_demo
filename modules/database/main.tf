resource "aws_db_instance" "mariadb" {
  allocated_storage = 10                      # 10 GB of storage, gives us more IOPS than a lower number
  engine            = "mariadb"
  engine_version    = "10.1.14"
  instance_class    = "${var.instance_class}" # use micro if you want to use the free tier
  identifier        = "mariadb"
  name              = "mariadb"
  username          = "root"                  # username
  password          = "${var.RDS_PASSWORD}"   # password

  #db_subnet_group_name    = "${aws_db_subnet_group.mariadb-subnet.name}"
  db_subnet_group_name    = "${var.db_subnets.name}"
  parameter_group_name    = "${aws_db_parameter_group.mariadb-parameters.name}"
  multi_az                = "false"                                             # set to true to have high availability: 2 instances synchronized with each other
  vpc_security_group_ids  = ["${var.security_group}"]
  storage_type            = "gp2"
  backup_retention_period = "${var.retention_period}"
  availability_zone       = "${aws_subnet.main-private-1.availability_zone}"    # prefered AZ

  tags {
    Name = "mariadb-instance"
  }
}
