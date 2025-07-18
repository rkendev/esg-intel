# main.tf

#######################################
# Global RG + random suffix
#######################################
resource "azurerm_resource_group" "rg" {
  name     = "${var.name_prefix}-rg"
  location = var.location
  tags     = var.tags
}

resource "random_id" "suffix" {
  byte_length = 4
}

terraform {
  required_version = ">= 1.6"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.117" # or any 3.x you like
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }

  backend "azurerm" {} # You already configured this via backend.hcl
}

provider "azurerm" {
  features {}
}

