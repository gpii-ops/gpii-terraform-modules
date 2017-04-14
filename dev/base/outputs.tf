output "access_key" {
  value = "${var.access_key}"
}
output "secret_key" {
  value = "${var.secret_key}"
}

output "region" {
  value = "${var.region}"
}

output "subnet_main_id" {
  value = "${aws_subnet.main.id}"
}

output "security_group_main_id" {
  value = "${aws_security_group.main.id}"
}
