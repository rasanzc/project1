#creacion del grupo de recursos: nombre y localización  
resource "azurerm_resource_group" "my_rg" {
  name     = var.resource_group_name
  location = var.location

  tags = var.tags
}