resource "aws_instance" "dumb_bastion" {
  ami = "${var.ami}"
  instance_type = "${var.instance_type}"
  key_name = "${var.key_name}"
  subnet_id = "${aws_subnet.mainsubnet.id}"
  tags {
    Name = "dumb bastion"
  }
}
