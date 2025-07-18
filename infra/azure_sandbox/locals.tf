############################################################
# Shared helpers – generated names, tags, RG reference
############################################################

locals {
  # ─── Naming ─────────────────────────────────────────────
  prefix = var.name_prefix # e.g. "esg-sbx"

  # central resource-group name (if you haven’t created one elsewhere)
  rg_name = "${local.prefix}-rg"

  # ─── Convenience tags ──────────────────────────────────
  base_tags = {
    project     = "esg-intel"
    environment = "sandbox"
    managed_by  = "terraform"
  }

  tags = merge(local.base_tags, var.tags)
}

# Optional: single RG for everything in the sandbox
# resource "azurerm_resource_group" "this" {
#  name     = local.rg_name
#  location = var.location
#  tags     = local.tags
# }

