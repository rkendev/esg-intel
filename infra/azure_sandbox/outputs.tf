output "storage_account_name" { value = azurerm_storage_account.lake.name }
output "acr_login_server" { value = azurerm_container_registry.acr.login_server }
output "postgres_connection_string" { value = azurerm_postgresql_flexible_server.pg.fqdn }
output "aks_kubeconfig" {
  value     = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive = true
}

