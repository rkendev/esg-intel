# acr.tf
resource "azurerm_container_registry" "acr" {
  name                = "esgacr${random_id.suffix.hex}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Basic"
  tags                = var.tags
}
