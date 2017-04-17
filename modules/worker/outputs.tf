# Connecting through the elastic ip serves as a test that the instance <-> eip
# connection is working.
output "public_ip" {
  value = "${aws_instance.main.public_ip}"
  # See note in instance.tf.
  # value = "${aws_eip.main_instance.public_ip}"
}
