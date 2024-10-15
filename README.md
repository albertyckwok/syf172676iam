# ExaCC/CS IAM

IAM group and policy to control access to activity specific compartments for database. It create the following group with the policy to grant appropriate authority to users in those groups.

1. Viewonly
1. DBA for database administrators
3. sysAdmin for system administrators.

## Getting Started

The simplest is to use Oracle Resource manager from UI, select Developer Services, Resource Manager, then stack to create and run it.

Alternatively, you can run it where ever you have Terraform for OCI setup. The following TF var need to be setup for your account, e.g. in .profile

```
export TF_VAR_tenancy_ocid="<tenancy OCID>"
export TF_VAR_user_ocid="<user OCID>"
export TF_VAR_fingerprint="<PEM key fingerprint>"
export TF_VAR_private_key_path="<path to the private key that matches the fingerprint above>"
```

### Prerequisites

Terraform with OCI plugin. All setup on devtool3.us.osc.oracle.com. You can login with your OSC Global LDAP ID.

### How to use:

```
. env-vars.sh
terraform init
terraform plan
terraform apply
```
**Note**:
- First apply may failed due to empty VNC ID for DNS resolver but should work by running apply again.
- To properly run destroy, you need to manually delete the forwarding rule before run terraform destroy as follow:
  1. VCN
  2. DNS Resolver on the right middle
  3. Select Rules at near bottom left
  4. Select the submenu (3 dots) next to the rule.
  5. Select remove.
