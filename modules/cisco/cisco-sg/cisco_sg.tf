#ec2 security group for cisco appliance
resource "aws_security_group" "cisco_security_group" {
    name = "${var.project_tag}-cisco-csr"
    description = "Cisco Cloud Services Router (CSR) 1000v security groups"
    vpc_id = "${var.vpc_id}"

#allows all outbound traffic
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

#allows traffic from the SG itself
    ingress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        self = true
    }

#allow traffic for TCP 22
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["${var.ssh_source_cidr_block}"]
    }

#allows traffic from the vpc
    ingress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["${var.vpc_cidr}"]
    }
}

output "cisco_security_group_id" {
  value = "${aws_security_group.cisco_security_group.id}"
}
