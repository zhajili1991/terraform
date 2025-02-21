variable "ARM_CLIENT_ID" {
  description = "Azure Service Principal Client ID"
  type        = string
}

variable "ARM_CLIENT_SECRET" {
  description = "Azure Service Principal Client Secret"
  type        = string
  sensitive   = true
}
# it could be expired

variable "ARM_SUBSCRIPTION_ID" {
  description = "Azure Subscription ID"
  type        = string
}

variable "ARM_TENANT_ID" {
  description = "Azure Tenant ID"
  type        = string
}

variable "storage_account_prefix" {
  description = "Prefix for all storage account names"
  type        = string
  default     = "krakow"
}