resource "aws_vpn_gateway" "vpn_gateway" {
  vpc_id = "${var.vpc_id}"
}

output "vpn_gtw_id" {
  value = "${aws_vpn_gateway.vpn_gateway.id}"
}

#####Neew to update based on vpn configuration#######
resource "aws_customer_gateway" "customer_gateway" {
  bgp_asn    = "${var.bgp_asn}"
  ip_address = "${var.cg_peer_ip}"
  type       = "ipsec.1"
}

resource "aws_vpn_connection" "main" {
  vpn_gateway_id      = "${aws_vpn_gateway.vpn_gateway.id}"
  customer_gateway_id = "${aws_customer_gateway.customer_gateway.id}"
  type                = "ipsec.1"
  static_routes_only  = "true"
}
