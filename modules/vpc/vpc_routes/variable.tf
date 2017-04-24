variable "project" {}
variable "vpc_id" {}
variable "default_route_table_id" {}
variable "vpc_igw_id" {}
variable "static_routes" {
  description = "customer network static routes"
  default = ["10.0.0.0/8", "192.168.0.0/24"]
}
variable "priv_subnet1_id" {}
variable "priv_subnet2_id" {}
variable "pub_subnet1_id" {}
variable "pub_subnet2_id" {}
variable "dmz_subnet1_id" {}
variable "dmz_subnet2_id" {}	
