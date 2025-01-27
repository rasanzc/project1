resource "random_id" "randomId" {
  keepers = {
    # Generate a new ID only when a new resource group is defined
    resource_group = azurerm_resource_group.my_rg.name
  }

  byte_length = 8
}
#creación storage account
resource "azurerm_storage_account" "mystorageaccount" {
  name                     = "diag${random_id.randomId.hex}"
  resource_group_name      = azurerm_resource_group.my_rg.name
  location                 = var.location
  account_replication_type = "LRS"
  account_tier             = "Standard"

  tags = var.tags
}