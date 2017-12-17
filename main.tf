# Reference details of the IBM Cloud Space
data "ibm_space" "space" {
  space = "${var.space}"
  org   = "${var.org}"
}

resource "ibm_service_instance" "profiledb" {
  name       = "profiledb-sp"
  space_guid = "${data.ibm_space.space.id}"
  service    = "cloudantNoSQLDB"
  plan       = "Lite"
  tags       = ["scott-tag"]
}
