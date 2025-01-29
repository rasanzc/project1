# Public IP 
resource "azurerm_public_ip" "votes_pip" {
  name                = "votes_ip"
  location            = var.location
  resource_group_name = azurerm_resource_group.my_rg.name
  allocation_method   = "Dynamic"
}
resource "azurerm_public_ip" "result_pip" {
  name                = "result_ip"
  location            = var.location
  resource_group_name = azurerm_resource_group.my_rg.name
  allocation_method   = "Dynamic"
}
resource "azurerm_public_ip" "db_pip" {
  name                = "db_ip"
  location            = var.location
  resource_group_name = azurerm_resource_group.my_rg.name
  allocation_method   = "Dynamic"
}