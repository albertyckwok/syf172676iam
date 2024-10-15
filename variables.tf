# ---- use variables defined in terraform.tfvars file
variable "uidList" {
  type = list(string)
  default = [ ]
}
variable "adminEmail" { default="albert.kwok@oracle.com" }
variable "accessSubnet" { default="N/A" }