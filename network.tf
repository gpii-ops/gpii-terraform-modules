# Copied from "Basic Example Usage, with default rules"
# https://www.terraform.io/docs/providers/aws/r/default_security_group.html
resource "aws_vpc" "mainvpc" {
  cidr_block = "10.11.0.0/16"  # These go to 11
  enable_dns_hostnames = true
  tags {
    Name = "main vpc"
  }
}

resource "aws_subnet" "mainsubnet" {
  vpc_id = "${aws_vpc.mainvpc.id}"
  # Use biggest subnets possible, according to
  # https://medium.com/aws-activate-startup-blog/practical-vpc-design-8412e1a18dcc#.4iftmeqja
  cidr_block = "10.11.32.0/19"
  tags {
    Name = "main subnet"
  }
}

# Copied from "Basic Example Usage, with default rules"
# https://www.terraform.io/docs/providers/aws/r/default_security_group.html
resource "aws_default_security_group" "default" {
  vpc_id = "${aws_vpc.mainvpc.id}"

  ingress {
    protocol  = -1
    self      = true
    from_port = 0
    to_port   = 0
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "terraform default security group"
  }
}

# Allow ssh from everywhere (for now)
resource "aws_security_group" "allow_ssh_from_everywhere" {
  #name = "allow_ssh_from_everywhere"
  description = "Allow inbound ssh from everywhere"
  vpc_id = "${aws_vpc.mainvpc.id}"
}

resource "aws_security_group_rule" "allow_ssh_from_everywhere" {
  type = "ingress"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.allow_ssh_from_everywhere.id}"
}
