data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

data "azurerm_subnet" "subnet" {
  name                 = var.subnet
  virtual_network_name = var.virtual_network
  resource_group_name  = var.resource_group_name
}

data "azurerm_network_security_group" "sg" {
  name                = var.security_group
  resource_group_name = var.resource_group_name
}

resource "azurerm_public_ip" "pub-ip" {
    name                         = "PublicIP-tf"
    location                     = data.azurerm_resource_group.rg.location
    resource_group_name          = data.azurerm_resource_group.rg.name
    #public_ip_address_allocation = "dynamic"
    sku                          = "Standard"
    allocation_method            = "Static"

}

resource "azurerm_network_interface" "ni" {
  name                = "nic-tf"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "ipconfiguration1"
    subnet_id                     = data.azurerm_subnet.subnet.id
    private_ip_address_allocation = "dynamic"
    public_ip_address_id          = azurerm_public_ip.pub-ip.id
  }
}

resource "azurerm_network_interface_security_group_association" "sg_assoc" {
    network_interface_id      = azurerm_network_interface.ni.id
    network_security_group_id = data.azurerm_network_security_group.sg.id
}


resource "azurerm_linux_virtual_machine" "vm" {
  count                 = var.instance_count
  #name                 = var.vm_name
  name                  = "vm-${count.index + 1}"
  location              = azurerm_network_interface.ni.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.ni.id]
  size               = var.vm_size

  admin_username = var.user
  #disable_password_authentication = true

  source_image_reference {
    publisher = var.vm_publisher
    offer     = var.vm_offer
    sku       = var.vm_sku
    version   = var.vm_image_version
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }
  
  admin_ssh_key {
    username   = var.user
    public_key = file("~/.ssh/sabya.pub")
  }
  tags = {
    environment = var.environment
  }
}
