resource "azurerm_postgresql_flexible_server" "pg" {
  name                   = "esgpg-dev${random_id.suffix.hex}"
  resource_group_name    = azurerm_resource_group.rg.name
  location               = azurerm_resource_group.rg.location

  # REMOVE the next two lines (or comment them out)
  # delegated_subnet_id     = azurerm_subnet.db.id
  # private_dns_zone_id     = azurerm_private_dns_zone.postgres.id

  public_network_access_enabled = true       # allow Internet access

  version                = "16"
  sku_name               = "B_Standard_B1ms"
  storage_mb             = 32768

  administrator_login    = var.db_admin
  administrator_password = var.db_password

  tags = var.tags
}

# OPTIONAL – open it for everyone until you add fine-grained rules
resource "azurerm_postgresql_flexible_server_firewall_rule" "allow_all" {
  name       = "allow-all"
  server_id  = azurerm_postgresql_flexible_server.pg.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "255.255.255.255"
}
