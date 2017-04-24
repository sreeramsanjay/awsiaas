#ec2 instance for cisco
resource "aws_instance" "cisco_csr" {
  count = 2
  ami = "${var.ami_id}"
  availability_zone = "${element(var.availability_zones, count.index)}"
  instance_type = "${var.cisco_instance_type}"
  key_name = "${var.ssk_key_name}"
  subnet_id = "${element(var.subnet_id, count.index)}"
  vpc_security_group_ids = ["${var.cisco_security_group_id}"]
  tags {
  Name = "${var.project_tag}-cisco-csr-${element(var.availability_zones, count.index)}"
    }
    iam_instance_profile = "${var.cisco_csr_instance_profile}"
}

output "cisco_ins_id" {
  value = ["${aws_instance.cisco_csr.*.id}"]
}

resource "aws_eip" "cisco_csr" {
  count = 2
  instance = "${element(aws_instance.cisco_csr.*.id, count.index)}"
}

output "cisco_eips" {
  value = ["${aws_instance.cisco_csr.*.public_ip}"]
}
