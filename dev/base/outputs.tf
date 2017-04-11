output "region" {
  value = "${var.region}"
}

output "subnet_main_id" {
  value = "${aws_subnet.main.id}"
}

output "security_group_main_id" {
  value = "${aws_security_group.main.id}"
}
