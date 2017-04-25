variable "region" {
  default = "us-east-1"
}
variable "vpc_id" {
  default = "vpc-c8a4b3ae"
}
variable "vpc_cidr" {
  default = "10.220.16.0/22"
}
variable "ssh_source_cidr_block" {
  default = "1.1.1.3/32"
}
variable "availability_zones" {
  type = "list"
  default = ["us-east-1c", "us-east-1d"]
}
variable "subnet_id" {
  type = "list"
  default = ["subnet-87fb20cf", "subnet-fdb552a7"]
}
variable "ami_id" {
  default = "ami-d17520c6"
}
variable "project_tag" {
  default = "IaaS-Pilot"
}
variable "ssk_key_name" {
  default = "RACONAWS"
}
variable "cisco_instance_type" {
  default = "c4.large"
}
