# azure_terraform
These terraform scripts spin up azure vms.

# Scripts:

provider.tf: Providers are interfaces to the services that maintain our resources.This file has details about Azure provider.
resources.tf: This file contains all the resource configurations.
variables.tf: It has all input variable declarations.
terraform.tfvars: This is the file where user needs to pass the desired values for all variables.
output.tf: This file provides output values.


# Deploy application
Terraform has four essential commands that allow us to deal with an end-to-end workflow:

terraform init
terraform plan
terraform apply
terraform destroy
