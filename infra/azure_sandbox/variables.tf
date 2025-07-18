###############################################################################
# 🔹  GLOBAL CONSTANTS
###############################################################################
variable "project_prefix" {
  description = "3-4 character code that identifies the project ('esg', etc.)"
  type        = string
  default     = "esg"
}

variable "environment" {
  description = "Deployment environment name: sandbox | dev | prod"
  type        = string
  default     = "sandbox"
}

variable "location" {
  description = "Azure region for the sandbox resources"
  type        = string
  default     = "westeurope"
}

###############################################################################
# 🔹  NAMING + TAGGING (used in locals.tf and across every resource)
###############################################################################
variable "name_prefix" {
  description = "Short prefix that appears in *every* Azure resource name, e.g. esg-sbx"
  type        = string
}

variable "tags" {
  description = "Key-value map of tags propagated to all resources"
  type        = map(string)
  default     = {}
}

###############################################################################
# 🔹  AKS CLUSTER SIZING
###############################################################################
variable "aks_node_size" {
  description = "VM size for nodes in the *default* AKS node-pool"
  type        = string
  default     = "Standard_B4ms"
}

variable "aks_node_count" {
  description = "Number of nodes in the default AKS node-pool"
  type        = number
  default     = 1
}

###############################################################################
# 🔹  POSTGRES FLEXIBLE SERVER SIZING
###############################################################################
variable "pg_flex_size" {
  description = "Compute SKU (vCores) for the PostgreSQL Flexible Server"
  type        = number # change to string if you’re passing a SKU name
  default     = 2
}

###############################################################################
# 🔹  SECRETS
###############################################################################
variable "db_admin" {
  description = "Admin username for PostgreSQL"
  type        = string
  default     = "esg_admin"
}

variable "db_password" {
  description = "Admin password for PostgreSQL (set via TF_VAR_db_password at runtime)"
  type        = string
  sensitive   = true
}

