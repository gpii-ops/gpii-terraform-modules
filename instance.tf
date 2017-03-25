resource "aws_instance" "main" {
  ami = "${lookup(var.amis, var.region)}"
  instance_type = "${var.instance_type}"
  key_name = "${var.key_name}"
  subnet_id = "${aws_subnet.main.id}"
  associate_public_ip_address = true
  vpc_security_group_ids = ["${aws_security_group.main.id}"]
  tags {
    Name = "main"
    # For use by ansible via terraform-inventory
    Group = "aws_gpii_ci_docker"
  }

  provisioner "remote-exec" {
    inline = [
      # kitchen runs sudo without a tty and gets this error:
      #
      # Failed to complete #verify action: [Sudo failed: Sudo requires a TTY.
      # Please see the README on how to configure sudo to allow for
      # non-interactive usage.] on default-centos
      #
      # I don't see a way to pass "-t" through kitchen or terraform so this is
      # a workaround.
      "sudo sed -i /etc/sudoers -e 's/Defaults    requiretty/Defaults    !requiretty/g'",
      #"sudo yum install python",
    ]
    connection {
      user = "centos"
    }
  }
}

resource "aws_eip" "main_instance" {
  instance = "${aws_instance.main.id}"
  vpc = true
}
