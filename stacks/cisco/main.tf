terraform {
  backend "s3" {
    bucket = "aa-tf-status"
    key    = "iaas-pilot/cisco.tfstatus"
    region = "us-east-1"
  }
}
provider "aws" {
  region = "${var.region}"
}
module "ec2iamrole" {
  source = "../../modules/cisco/ec2-role"
}
module "cisco-sg" {
  source = "../../modules/cisco/cisco-sg"
  vpc_id = "${var.vpc_id}"
  project_tag = "${var.project_tag}"
  vpc_cidr = "${var.vpc_cidr}"
  ssh_source_cidr_block = "${var.ssh_source_cidr_block}"
}
module "appliance" {
  source = "../../modules/cisco/appliance"
  ami_id = "${var.ami_id}"
  ssk_key_name = "${var.ssk_key_name}"
  cisco_instance_type = "${var.cisco_instance_type}"
  project_tag = "${var.project_tag}"
  subnet_id = "${var.subnet_id}"
  cisco_csr_instance_profile = "${module.ec2iamrole.cisco_csr_instance_profile}"
  availability_zones = "${var.availability_zones}"
  cisco_security_group_id = "${module.cisco-sg.cisco_security_group_id}"
}
output "cisco_address" {
  value = "${module.appliance.cisco_eips}"
}

