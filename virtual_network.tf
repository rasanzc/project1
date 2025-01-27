#red privada
resource "azurerm_virtual_network" "my_virtual_network" {
  name                = var.vnet_name
  address_space       = var.cidr_block
  location            = var.location
  resource_group_name = azurerm_resource_group.my_rg.name

  tags = var.tags
}