
resource "oci_identity_user" "users" {
  provider = oci.home_region
  count               = length(var.uidList)
  name           = var.uidList[count.index]
  email          = var.uidList[count.index]
  description    = "Users for PoC activity using ${data.oci_identity_compartment.test_compartment.name}"
  compartment_id = var.tenancy_ocid
}
resource "oci_identity_ui_password" "passwords" {
  provider = oci.home_region
  count               = length(var.uidList)
  user_id        = oci_identity_user.users.*.id[count.index]
}
resource "oci_identity_user_group_membership" "view-mem1" {
  provider = oci.home_region
  count               = length(var.uidList)
  user_id        = oci_identity_user.users[count.index].id
  group_id       = oci_identity_group.viewOnlyGroup.id
}
resource "oci_identity_user_group_membership" "dba-mem1" {
  provider = oci.home_region
  count               = length(var.uidList)
  user_id        = oci_identity_user.users[count.index].id
  group_id       = oci_identity_group.dbaGroup.id
}
resource "oci_identity_user_group_membership" "sysAdmin-mem1" {
  provider = oci.home_region
  count               = length(var.uidList)
  user_id        = oci_identity_user.users[count.index].id
  group_id       = oci_identity_group.sysAdminGroup.id
}
