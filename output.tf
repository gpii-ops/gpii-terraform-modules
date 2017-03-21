output "public_dns" {
  value = "${aws_instance.dumb_bastion.public_dns}"
}
