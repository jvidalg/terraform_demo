output "public_subnets" {
  value = "${aws_subnet.tf_public_subnet.*.id}"
}

output "public_sg" {
  value = "${aws_security_group.tf_public_sg.id}"
}

output "subnet_ips" {
  value = "${aws_subnet.tf_public_subnet.*.cidr_block}"
}

output "db_subnets" {
  value = "${aws_subnet.tf_db_subnet.*.id}"
}

output "db_sg" {
  value = "${aws_security_group.tf_db_sg.id}"
}

output "elb_sg" {
  value = "${aws_security_group.elbsg.id}"
}
