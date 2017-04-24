terraform {
  backend "s3" {
    bucket = "aa-tf-status"
    key    = "iaas-pilot/vpc-build.tfstatus"
    region = "us-east-1"
  }
}
provider "aws" {
  region = "${var.region}"
}
module "vpc" {
  source = "../../modules/vpc/vpc"
  vpc_cidr_block = "${var.vpc_cidr}"
  project = "${var.project_tag}"
  availability_zones = "${var.availability_zones}"
  priv_cidr = "${var.priv_cidr}"
  priv_count = "${var.priv_count}"
  pub_count = "${var.pub_count}"
  dmz_count = "${var.dmz_count}"
  pub_cidr = "${var.pub_cidr}"
  dmz_cidr = "${var.dmz_cidr}"
}
module "s3_endpoint" {
  source = "../../modules/vpc/s3_endpoint"
  dmz_routetable_id = "${module.vpc_routes.dmz_routetable_id}"
  vpc_id = "${module.vpc.vpc_id}"
  default_route_table_id = "${module.vpc.default_route_table_id}"
}
#module "vpn_tunnel" {
#  source = "../../modules/vpc/vpn_tunnel"
#  vpc_id = "${module.vpc.vpc_id}"
#}
module "vpc_routes" {
  source = "../../modules/vpc/vpc_routes"
  default_route_table_id = "${module.vpc.default_route_table_id}"
  project = "${var.project_tag}"
  vpc_id = "${module.vpc.vpc_id}"
  vpc_igw_id = "${module.vpc.internet_gateway_id}"
  priv_subnet1_id = "${module.vpc.priv_subnet1_id}"
  priv_subnet2_id = "${module.vpc.priv_subnet2_id}"
  pub_subnet1_id = "${module.vpc.pub_subnet1_id}"
  pub_subnet2_id = "${module.vpc.pub_subnet2_id}"
  dmz_subnet1_id = "${module.vpc.dmz_subnet1_id}"
  dmz_subnet2_id = "${module.vpc.dmz_subnet2_id}"
}

output "vpc_id" {
  value = "${module.vpc.vpc_id}"
}

output "subnet_ids" {
  value = ["priv_subnet1: ${module.vpc.priv_subnet1_id}","priv_subnet2: ${module.vpc.priv_subnet2_id}","pub_subnet1: ${module.vpc.pub_subnet1_id}","pub_subnet2: ${module.vpc.pub_subnet2_id}","dmz_subnet1: ${module.vpc.dmz_subnet1_id}","dmz_subnet2: ${module.vpc.dmz_subnet2_id}"]
}

