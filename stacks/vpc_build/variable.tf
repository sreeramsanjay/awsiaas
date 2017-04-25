variable "region" {
  default = "us-east-1"
}
variable "availability_zones" {
  default = ["us-east-1c", "us-east-1d"]
}
variable "dmz_count" {
  default = "2"
}
variable "priv_count" {
  default = "2"
}
variable "pub_count" {
  default = "2"
}
variable "vpc_cidr" {
  description = "CIDR for the whole VPC"
  default = "10.220.16.0/22"
}
variable "dmz_cidr" {
  description = "CIDR for the Dmz Subnet"
  default = ["10.220.17.128/25", "10.220.19.128/25"]
}
variable "priv_cidr" {
  description = "CIDR for the Private Subnet"
  default = ["10.220.16.0/24", "10.220.18.0/24"]
}
variable "pub_cidr" {
  description = "CIDR for the Public agent Subnets"
  default = ["10.220.17.0/25", "10.220.19.0/25"]
}
variable "project_tag" {
  default = "BuildFromGoCD"
}
