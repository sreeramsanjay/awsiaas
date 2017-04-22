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
  source = "../../modules/vpc"
  vpc_cidr_block = "${var.vpc_cidr}"
  project = "${var.project_tag}"
}
module "s3_endpoint" {
  source = "../../modules/s3_endpoint"
  dmz_routetable_id = "${module.vpc_routes.dmz_routetable_id}"
  vpc_id = "${module.vpc.vpc_id}"
  default_route_table_id = "${module.vpc.default_route_table_id}"
}
#module "vpn_tunnel" {
#  source = "../../modules/vpn_tunnel"
#  vpc_id = "${module.vpc.vpc_id}"
#}
module "vpc_routes" {
  source = "../../modules/vpc_routes"
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
