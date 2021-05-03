output "azure_vm_name" {
  value = var.vm_name
}

output "azure_vm_public_ip" {
  value = azurerm_public_ip.pub-ip.ip_address
}
