resource "azurerm_kubernetes_cluster" "aks" {
  name                = "esg-aks-sbx"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "esg-sbx"

  default_node_pool {
    name       = "system"
    vm_size    = var.aks_node_size
    node_count = var.aks_node_count
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = "azure"
  }

  tags = local.tags
}

