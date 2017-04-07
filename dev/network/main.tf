resource "aws_vpc" "main" {
  cidr_block = "10.11.0.0/16"  # These go to 11
  enable_dns_hostnames = true
  tags {
    Name = "main vpc"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = "${aws_vpc.main.id}"
  tags {
    Name = "main internet gateway"
  }
}

resource "aws_subnet" "main" {
  vpc_id = "${aws_vpc.main.id}"
  # Use biggest subnets possible, according to
  # https://medium.com/aws-activate-startup-blog/practical-vpc-design-8412e1a18dcc#.4iftmeqja
  cidr_block = "10.11.32.0/19"
  depends_on = ["aws_internet_gateway.main"]
  tags {
    Name = "main subnet"
  }
}

resource "aws_route_table" "main" {
  vpc_id = "${aws_vpc.main.id}"
  tags {
    Name = "main route table"
  }
}

resource "aws_route" "everything_through_main_internet_gateway" {
  route_table_id = "${aws_route_table.main.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = "${aws_internet_gateway.main.id}"
}

resource "aws_route_table_association" "main" {
  subnet_id = "${aws_subnet.main.id}"
  route_table_id = "${aws_route_table.main.id}"
}

resource "aws_default_security_group" "default" {
  vpc_id = "${aws_vpc.main.id}"
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
    Name = "terraform default"
  }
}

# Allow ssh from everywhere (for now)
resource "aws_security_group" "main" {
  name = "main security group"
  description = "Allow ssh from everywhere"
  vpc_id = "${aws_vpc.main.id}"
  tags {
    Name = "main security group"
  }
}

resource "aws_security_group_rule" "allow_ssh_from_everywhere" {
  type = "ingress"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.main.id}"
}

resource "aws_security_group_rule" "allow_all_outbound" {
  type = "egress"
  from_port = 0
  to_port = 0
  protocol = "all"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.main.id}"
}
