variable "project_name" {
  description = "Base name for all resources"
  type        = string
  default     = "gimbus"
}

variable "location" {
  description = "Azure region to deploy resources (e.g. nortcentralus)"
  type        = string
  default     = "northcentralus"
}

variable "tags" {
  description = "Tags for the resources"
  type        = map(string)
  default = {
    environment = "Dev"
    owner       = "Gimbus"
  }
}

# ACR
variable "acr_sku" {
  description = "SKU for the Container Registry (Basic, Standard, Premium)"
  type        = string
  default     = "Basic"
}

# AKS
variable "aks_node_count" {
  description = "Number of nodes in the default AKS node pool"
  type        = number
  default     = 1
}

variable "aks_vm_size" {
  description = "VM size for AKS nodes"
  type        = string
  default     = "Standard_B2als_v2"
}

# Key Vault
variable "kv_sku" {
  description = "SKU for Azure Key Vault (Standard, Premium)"
  type        = string
  default     = "standard"
}

# Storage Account
variable "storage_replication_type" {
  description = "Replication type for the storage account (LRS, GRS, RAGRS)"
  type        = string
  default     = "LRS"
}