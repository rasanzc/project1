resource "azurerm_network_interface" "nic_votes" {
  name                = "nic_votes"
  location            = azurerm_resource_group.my_rg.location
  resource_group_name = azurerm_resource_group.my_rg.name
  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = azurerm_subnet.subnet["public_subnet"].id
    private_ip_address_allocation = "Dynamic"
  }
}

# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "nic_votes_assoc" {
  network_interface_id      = azurerm_network_interface.nic_votes.id
  network_security_group_id = azurerm_network_security_group.my_nsg_public.id
}


resource "azurerm_network_interface" "nic_result" {
  name                = "nic_result"
  location            = azurerm_resource_group.my_rg.location
  resource_group_name = azurerm_resource_group.my_rg.name
  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = azurerm_subnet.subnet["public_subnet"].id
    private_ip_address_allocation = "Dynamic"
  }
}

# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "nic_result_assoc" {
  network_interface_id      = azurerm_network_interface.nic_result.id
  network_security_group_id = azurerm_network_security_group.my_nsg_public.id
}


resource "azurerm_network_interface" "nic_db" {
  name                = "nic_db"
  location            = azurerm_resource_group.my_rg.location
  resource_group_name = azurerm_resource_group.my_rg.name
  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = azurerm_subnet.subnet["private_subnet"].id
    private_ip_address_allocation = "Dynamic"
  }
}

# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "nic_db_assoc" {
  network_interface_id      = azurerm_network_interface.nic_db.id
  network_security_group_id = azurerm_network_security_group.my_nsg_private.id
}