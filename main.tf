locals { 
    vcnComp = var.accessSubnet == "N/A" ? var.compartment_ocid : data.oci_core_subnet.test_subnet.compartment_id
}
data "oci_core_subnet" "test_subnet" {
    subnet_id = var.accessSubnet
}
data "oci_identity_compartment" "test_compartment" {
    id = var.compartment_ocid
}
#/* You need to comment out the next 2 output config if you are deleting IDs or you will get Invalid argument lenght when run terraform plan
output "accessCredentials" {
  sensitive = false
  value = formatlist(
    "echo '%v' | mailx -s 'OCI access info - DO NOT REPLY NOR FORWARD' -b %v %v",
    oci_identity_ui_password.passwords.*.password,
    var.adminEmail,
    var.uidList,
  )
}
#*/
