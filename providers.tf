#Configure Azure Provider
provider "azurerm" {
  version = "2.20.0"
  subscription_id = var.subscription_id
  tenant_id = var.tenant_id
  #client_id = var.client_id
  #client_secret = var.client_secret
  skip_provider_registration = true
  features {}
}
