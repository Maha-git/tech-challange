provider aws {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.region}"
}

resource "aws_security_group" "testvm" {
  name        = "${var.email-address} testvm Security Group"
  description = "Accept incoming connections."

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["${var.permitted_ips}"]
  }

  egress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  vpc_id = "${var.vpcid}"
  tags   = "${merge(map("Name", "testvm SG"))}"
}

data "aws_ami" "testvm" {
  most_recent = true
  owners = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-cosmic-18.10-amd64-server-*"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }

}

data "template_file" "testvm" {
  template = "${file("user_data.tmpl")}"
}

resource "aws_instance" "testvm" {
  ami           = "${data.aws_ami.testvm.id}"
  instance_type = "t2.micro"
  key_name      = ""
  monitoring    = true


  root_block_device {
    volume_type           = "gp2"
    volume_size           = "32"
    delete_on_termination = true
  }
  vpc_security_group_ids = ["${aws_security_group.testvm.id}"]
  subnet_id              = "${var.subnetid}"
  source_dest_check      = true
  tags                   = "${merge(map("Name", "${var.email-address} testvm Server"))}"
  user_data              = "${data.template_file.testvm.rendered}"
}

output "testvm_PublicIP" {
  value = "${aws_instance.testvm.public_ip}"
}

output "testvm_PublicDNS" {
  value = "${aws_instance.testvm.public_dns}"
}
