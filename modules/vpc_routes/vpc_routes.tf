# Routing table for dmz subnets
resource "aws_route_table" "dmz" {
  vpc_id = "${var.vpc_id}"
  route {
          cidr_block = "0.0.0.0/0"
          gateway_id = "${var.vpc_igw_id}"
        }
        tags {
          Name = "${var.project}-dmz-rt"
        }
}
output "dmz_routetable_id" {
  value = "${aws_route_table.dmz.id}"
}

resource "aws_route_table_association" "dmz-subnet1" {
  subnet_id = "${var.dmz_subnet1_id}"
  route_table_id = "${aws_route_table.dmz.id}"
}

resource "aws_route_table_association" "dmz-subnet2" {
  subnet_id = "${var.dmz_subnet2_id}"
  route_table_id = "${aws_route_table.dmz.id}"
}

# Routing table for private and public subnets
resource "aws_route_table_association" "priv-subnet1" {
  subnet_id = "${var.priv_subnet1_id}"
  route_table_id = "${var.default_route_table_id}"
}
resource "aws_route_table_association" "priv-subnet2" {
  subnet_id = "${var.priv_subnet2_id}"
  route_table_id = "${var.default_route_table_id}}"
}
resource "aws_route_table_association" "pub-agent-subnet1" {
  subnet_id = "${var.pub_subnet1_id}"
  route_table_id = "${var.default_route_table_id}}"
}
resource "aws_route_table_association" "pub-agent-subnet2" {
  subnet_id = "${var.pub_subnet2_id}"
  route_table_id = "${var.default_route_table_id}}"
}
