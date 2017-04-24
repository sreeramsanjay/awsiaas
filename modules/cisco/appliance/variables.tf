variable "ami_id" {}
variable "ssk_key_name" {}
variable "project_tag" {}
variable "subnet_id" { type = "list" }
variable "availability_zones" { type = "list" }
variable "cisco_csr_instance_profile" {}
variable "cisco_security_group_id" {}
variable "cisco_instance_type" {}
