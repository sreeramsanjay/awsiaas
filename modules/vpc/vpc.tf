resource "aws_vpc" "default" {
  cidr_block = "${var.vpc_cidr_block}"
  enable_dns_hostnames = "true"
  tags {
        Name = "${var.project}-vpc"
      }
}
output "vpc_id" {
  value = "${aws_vpc.default.id}"
}
output "default_route_table_id" {
  value = "${aws_vpc.default.main_route_table_id}"
}

#Internet Gateway
resource "aws_internet_gateway" "default" {
  vpc_id = "${aws_vpc.default.id}"
  tags {
         Name = "${var.project}-igw"
        }
}
output "internet_gateway_id" {
  value = "${aws_internet_gateway.default.gateway_id}"
}

# DMZ subnets
resource "aws_subnet" "dmz-subnet" {
  count = "${var.dmz_count}"
  vpc_id = "${aws_vpc.default.id}"
  cidr_block = "${element(var.dmz_cidr, count.index)}"
  availability_zone = "${element(var.availability_zones, count.index)}"
  tags {
         Name = "${var.project}-dmz-subnet${count.index}"
 	}
}
output "dmz_subnet1_id" {
  value = "${aws_subnet.dmz-subnet.0.id}"
}
output "dmz_subnet2_id" {
 value = "${aws_subnet.dmz-subnet.1.id}"
}

# Private Agent subnets
resource "aws_subnet" "priv-subnet" {
  count = "${var.priv_count}"
  vpc_id = "${aws_vpc.default.id}"
  cidr_block = "${element(var.priv_cidr, count.index)}"
  availability_zone = "${element(var.availability_zones, count.index)}"
}
output "priv_subnet1_id" {
  value = "${aws_subnet.priv-subnet.0.id}"
}
output "priv_subnet2_id" {
 value = "${aws_subnet.priv-subnet.1.id}"
}

#Public Agnet subnets
resource "aws_subnet" "pub-subnet" {
  count = "${var.pub_count}"
  vpc_id = "${aws_vpc.default.id}"
  cidr_block = "${element(var.pub_cidr, count.index)}"
  availability_zone = "${element(var.availability_zones, count.index)}"
}
output "pub_subnet1_id" {
  value = "${aws_subnet.pub-subnet.0.id}"
}
output "pub_subnet2_id" {
 value = "${aws_subnet.pub-subnet.1.id}"
}
