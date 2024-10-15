#!/bin/bash
echo Albert test email
export TF_VAR_uidList='["albertyckwok@gmail.com"]'
echo app subnet in SCA VCN FC cage
export TF_VAR_accessSubnet="ocid1.subnet.oc1.us-sanjose-1.aaaaaaaa3wxwrhhaioksasjmjwvfiqidxswq54nrtf5slr3ixrp66yofrkwq"
echo Tenant oscnas001
export TF_VAR_tenancy_ocid="ocid1.tenancy.oc1..aaaaaaaalmxrgmsqoou26rdybgthdwtwdwhn7km5oq3u25f6bdpoxihqef6q"
#export TF_VAR_region="us-ashburn-1"
echo SJC region
export TF_VAR_region="us-sanjose-1"
echo Setting comparment to ExaCC2VM6
export TF_VAR_compartment_ocid="ocid1.compartment.oc1..aaaaaaaayczowoi3sam2anvlhem2pcpeppdymtfla3nnrt24wexfwfwznv7a"
#echo Setting comparment to ExaCC9VM3
#export TF_VAR_compartment_ocid="ocid1.compartment.oc1..aaaaaaaacdlmbvvxvbuej3eyzlhfgl6f3nyjfag7eey3j4o4vjgvf5yvsrhq"
#echo Setting comparment to ExaCC9VM5
#export TF_VAR_compartment_ocid="ocid1.compartment.oc1..aaaaaaaawfbipx26mtutfl7mslhum7nipe3enxghxx3maixvadqprknym6ga"
#echo Setting comparment to ExaCC9VM8
#export TF_VAR_compartment_ocid="ocid1.compartment.oc1..aaaaaaaahkb6fzdwqr6gsgkxr3rjfmkwt5deobxxihbhpxdeij7hwasqvuqq"
echo Make sure to reset the following that match the tenancy
echo export TF_VAR_user_ocid=
echo 'set |grep TF_VAR'
### Authentication details that is user specific so it should be in .profile
#export TF_VAR_tenancy_ocid="<tenancy OCID>"
#export TF_VAR_user_ocid="<user OCID>"
#export TF_VAR_fingerprint="<PEM key fingerprint>"
#export TF_VAR_private_key_path="<path to the private key that matches the fingerprint above>"