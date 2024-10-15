resource "oci_identity_group" "viewOnlyGroup" {
  provider = oci.home_region
  name           = "OSC${data.oci_identity_compartment.test_compartment.name}ViewOnly"
  description    = "group created by terraform"
  compartment_id = var.tenancy_ocid
}
resource "oci_identity_policy" "policyViewOnly" {
  provider = oci.home_region
  name           = "OSC${data.oci_identity_compartment.test_compartment.name}PolicyViewOnly"
  description    = "policy created by terraform"
  compartment_id = var.tenancy_ocid

  statements = [
    "Allow group id ${oci_identity_group.viewOnlyGroup.id} to read all-resources in compartment id ${var.compartment_ocid}",
    "Allow group id ${oci_identity_group.viewOnlyGroup.id} to manage objects in compartment id ${var.compartment_ocid} where all {request.permission = 'OBJECT_CREATE'}",
    # The following 3 statement is to allow viewonly lab 1 and 2 for lesson 5: security and access control
    "Allow group id ${oci_identity_group.viewOnlyGroup.id} to read users in tenancy",
    "Allow group id ${oci_identity_group.viewOnlyGroup.id} to read groups in tenancy",
    "Allow group id ${oci_identity_group.viewOnlyGroup.id} to read policies in tenancy",
    # Allow user to query compartment to navagate to the leave compartment using OCI CLI
    "Allow group id ${oci_identity_group.viewOnlyGroup.id} to read compartments in tenancy",
    # Allow user to use cloud shell
    "Allow group id ${oci_identity_group.viewOnlyGroup.id} to use cloud-shell in tenancy",
    #The next policy is to allow user to do the AUDIT lab as creating/upload object does not have a "Request action types" to be filtered on therefore, we need to allow them to create bucket that has an action type of POST
    "Allow group id ${oci_identity_group.viewOnlyGroup.id} to manage buckets in compartment id ${var.compartment_ocid} where all {request.permission = 'BUCKET_CREATE'}",
    #Allow user to use bastion for SSH tunnel for browser with SOCKS5, sqlplus to DB, ssh to VM nodes, etc
    "Allow group id ${oci_identity_group.viewOnlyGroup.id} to use bastion in compartment id ${var.compartment_ocid}",
    "Allow group id ${oci_identity_group.viewOnlyGroup.id} to manage bastion-session in compartment id ${var.compartment_ocid}",
    #Allow user to use Oracle Secure Desktop (OSD)
    "Allow group id ${oci_identity_group.viewOnlyGroup.id} to use published-desktops in compartment id ${var.compartment_ocid}",
    #Allow user to read VCN info to create SSH tunnel to their desktop
    "Allow group id ${oci_identity_group.viewOnlyGroup.id} to read virtual-network-family in compartment id ${local.vcnComp}",
    # Allow to view the infra and vm network in infra compartment
    "Allow group id ${oci_identity_group.viewOnlyGroup.id} to read exadata-infrastructures in compartment id ${data.oci_identity_compartment.test_compartment.compartment_id}",
  ]
}
resource "oci_identity_group" "dbaGroup" {
  provider = oci.home_region
  name           = "OSC${data.oci_identity_compartment.test_compartment.name}dba"
  description    = "group created by terraform"
  compartment_id = var.tenancy_ocid
}

resource "oci_identity_policy" "policydba" {
  provider = oci.home_region
  name           = "OSC${data.oci_identity_compartment.test_compartment.name}Policydba"
  description    = "policy created by terraform"
  compartment_id = var.tenancy_ocid

  statements = [
    "Allow group id ${oci_identity_group.dbaGroup.id} to manage db-homes in compartment id ${var.compartment_ocid}",
    "Allow group id ${oci_identity_group.dbaGroup.id} to manage databases in compartment id ${var.compartment_ocid}",
    "Allow group id ${oci_identity_group.dbaGroup.id} to manage pluggable-databases in compartment id ${var.compartment_ocid}",
    "Allow group id ${oci_identity_group.dbaGroup.id} to manage database-software-images in compartment id ${var.compartment_ocid}",
    "Allow group id ${oci_identity_group.dbaGroup.id} to manage backup-destinations in compartment id ${var.compartment_ocid}",
    "Allow group id ${oci_identity_group.dbaGroup.id} to manage ons-topics in compartment id ${var.compartment_ocid}",
    "Allow group id ${oci_identity_group.dbaGroup.id} to manage ons-subscriptions in compartment id ${var.compartment_ocid}",
    #Allow DBA to use stack with terraform and VCS such as GitHub, GitLab, etc.
    "Allow group id ${oci_identity_group.dbaGroup.id} to use orm-stacks in tenancy",
    "Allow group id ${oci_identity_group.dbaGroup.id} to manage orm-jobs in tenancy",
  ]
}
resource "oci_identity_group" "sysAdminGroup" {
  provider = oci.home_region
  name           = "OSC${data.oci_identity_compartment.test_compartment.name}sysAdmin"
  description    = "Group for System administrator to scale VM Cluster"
  compartment_id = var.tenancy_ocid
}
resource "oci_identity_policy" "policysysAdmin" {
  provider = oci.home_region
  name           = "OSC${data.oci_identity_compartment.test_compartment.name}PolicysysAdmin"
  description    = "Policy for System administrator to scale VM Cluster"
  compartment_id = var.tenancy_ocid

  statements = [
    #Allow sysAdmin group to scale VM Cluster, wait 10min to effect non home region
    "Allow group id ${oci_identity_group.sysAdminGroup.id} to use exadata-infrastructures in compartment id ${data.oci_identity_compartment.test_compartment.compartment_id}",
    "Allow group id ${oci_identity_group.sysAdminGroup.id} to use vmclusters in compartment id ${var.compartment_ocid}",
    "Allow group id ${oci_identity_group.sysAdminGroup.id} to manage db-nodes in compartment id ${var.compartment_ocid}",
    #Allow sysAdmin to create and delete stack with terraform and VCS such as GitHub, GitLab, etc.
    "Allow group id ${oci_identity_group.sysAdminGroup.id} to manage orm-stacks in tenancy",
    "Allow group id ${oci_identity_group.sysAdminGroup.id} to manage orm-jobs in tenancy",
  ]
}