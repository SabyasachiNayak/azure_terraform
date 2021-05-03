variable "subscription_id" {}
variable "tenant_id" {}
#variable "client_id" {}
#variable "client_secret" {}
variable "resource_group_name" { default = "privacera"}
variable "resource_group_location" {}

variable "virtual_network" {}
variable "subnet" {}

variable "vm_name" {}
variable "region" {}
variable "vm_size" {
  default = "Standard_D4s_v3"
}
variable "instance_count" {}
variable "user" {}
variable "security_group" {}

variable "vm_publisher" {}
variable "vm_offer" {}
variable "vm_sku" {}
variable "vm_image_version" {}

variable "environment" {}
