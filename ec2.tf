resource "aws_vpc" "vpc" {
  cidr_block = "172.16.0.0/16"
}

resource "aws_subnet" "subnet" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "172.16.10.0/24"
  availability_zone = "us-west-2a"
}

resource "aws_network_interface" "nic" {
  subnet_id   = "${aws_subnet.subnet.id}"
  private_ips = ["172.16.10.100"]
}

resource “aws_instance” “complexcalc” 
{
ami                    = "ami-ebd02392"
instance_type          = "t2.large"
key_name               = "user1"
monitoring             = true
network_interface {
    network_interface_id = "${aws_network_interface.nic.id}"
    device_index         = 0
  }

  credit_specification {
    cpu_credits = "unlimited"
  }
root_block_device {
        volume_size = 20
  }
ebs_block_device {
		volume_size = 100
  }
