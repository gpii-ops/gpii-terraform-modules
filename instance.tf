resource "aws_instance" "main" {
  ami = "${var.ami}"
  instance_type = "${var.instance_type}"
  key_name = "${var.key_name}"
  subnet_id = "${aws_subnet.main.id}"
  associate_public_ip_address = true
  vpc_security_group_ids = ["${aws_security_group.main.id}"]
  tags {
    Name = "main"
  }
}

resource "aws_eip" "main_instance" {
  instance = "${aws_instance.main.id}"
  vpc = true
}
