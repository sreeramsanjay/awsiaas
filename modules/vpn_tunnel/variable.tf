variable  "vpc_id" {}
variable "bgp_asn" {
  description = "bgp asm number"
  default = "65000"
}
variable "cg_peer_ip" {
  description = "customer peer ip"
  default = "55.10.2.12"
}

