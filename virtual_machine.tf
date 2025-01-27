# Create (and display) an SSH key
resource "tls_private_key" "example_ssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
output "tls_private_key" {
  value     = tls_private_key.example_ssh.private_key_pem
  sensitive = true
}

resource "azurerm_linux_virtual_machine" "my_vm_votes" {
  name                  = var.vm_instance_vote.name
  location              = var.location
  resource_group_name   = azurerm_resource_group.my_rg.name
  network_interface_ids = [
    azurerm_network_interface.nic_votes.id,
    azurerm_network_interface.nic_votes_priv.id
  ]
  size                  = var.vm_size

  os_disk {
    name                 = "myOsDisk_votes"
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  admin_username      = var.admin_username
  admin_password      = var.admin_password

  admin_ssh_key {
    username   = "azureuser"
    public_key = tls_private_key.example_ssh.public_key_openssh
  }

  boot_diagnostics {
    storage_account_uri = azurerm_storage_account.mystorageaccount.primary_blob_endpoint
  }

  tags = var.tags
}
resource "azurerm_linux_virtual_machine" "my_vm_result" {
  name                  = var.vm_instance_result.name
  location              = var.location
  resource_group_name   = azurerm_resource_group.my_rg.name
  network_interface_ids = [
    azurerm_network_interface.nic_result.id,
    azurerm_network_interface.nic_result_priv.id
  ]
  size                  = var.vm_size

  os_disk {
    name                 = "myOsDisk_result"
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
  admin_username      = var.admin_username
  admin_password      = var.admin_password
 
  admin_ssh_key {
    username   = "azureuser"
    public_key = tls_private_key.example_ssh.public_key_openssh
  }

  boot_diagnostics {
    storage_account_uri = azurerm_storage_account.mystorageaccount.primary_blob_endpoint
  }

  tags = var.tags
}

resource "azurerm_linux_virtual_machine" "my_vm_db" {
  name                  = var.vm_instance_db.name
  location              = var.location
  resource_group_name   = azurerm_resource_group.my_rg.name
  network_interface_ids = [
    azurerm_network_interface.nic_db.id
  ]
  size                  = var.vm_size

  os_disk {
    name                 = "myOsDisk_db"
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  admin_username      = var.admin_username
  admin_password      = var.admin_password


  admin_ssh_key {
    username   = "azureuser"
    public_key = tls_private_key.example_ssh.public_key_openssh
  }

  boot_diagnostics {
    storage_account_uri = azurerm_storage_account.mystorageaccount.primary_blob_endpoint
  }

  tags = var.tags
}