variable "vpc_cidr_block" {}
variable "project" {}
variable "dmz_count" {}
variable "priv_count" {}
variable "pub_count" {}
variable "availability_zones" { type = "list" }
variable "dmz_cidr" { type = "list" }
variable "priv_cidr" { type = "list" }
variable "pub_cidr" { type = "list" }
