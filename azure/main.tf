# #keyvault configuration

# data "azurerm_client_config" "current" {}

# resource "azurerm_key_vault" "zhajili-keyvault" {
#   name                        = "zhajili-keyvault"
#   location                    = azurerm_resource_group.zhajili-lab.location
#   resource_group_name         = azurerm_resource_group.zhajili-lab.name
#   enabled_for_disk_encryption = true
#   tenant_id                   = data.azurerm_client_config.current.tenant_id
#   soft_delete_retention_days  = 7
#   purge_protection_enabled    = true

#   sku_name = "standard"

#   access_policy {
#     tenant_id = data.azurerm_client_config.current.tenant_id
#     object_id = data.azurerm_client_config.current.object_id

#     key_permissions = [
#       "Get","List",
#     ]
#     certificate_permissions = [
#       "Import","Get",]
#     secret_permissions = [
#       "Get","List",
#     ]
#   }
# }

# #AKS config

# resource "azurerm_kubernetes_cluster" "zhajili-aks" {
#   name                = "zhajili-aks"
#   location            = azurerm_resource_group.zhajili-lab.location
#   resource_group_name = azurerm_resource_group.zhajili-lab.name
#   dns_prefix          = "zhajiliaks"

#   default_node_pool {
#     name       = "default"
#     node_count = 1
#     vm_size    = "Standard_D2_v2"
#   }

#   identity {
#     type = "SystemAssigned"
#   }

#   tags = {
#     Environment = "DEV"
#   }
# }

# output "client_certificate" {
#   value     = azurerm_kubernetes_cluster.zhajili-aks.kube_config[0].client_certificate
#   sensitive = true
# }

# output "kube_config" {
#   value = azurerm_kubernetes_cluster.zhajili-aks.kube_config_raw

#   sensitive = true
# }

# # resource "azurerm_role_assignment" "acr-aks" {
# #   principal_id                     = azurerm_kubernetes_cluster.zhajili-aks.kubelet_identity[0].principal_id
# #   role_definition_name             = "AcrPull"
# #   scope                            = azurerm_container_registry.zhajiliacr.id
# #   skip_service_principal_aad_check = true
# # }

module "network" {
  source             = "./modules/network"
  location           = "East US"
  purpose            = "labbing"
  location_tag       = "Krakow"
  env                = "develop"
}

# module "aks" {
#   source              = "./modules/aks"
#   cluster_name        = "bguliyev-aks"
#   location            = "East US"
#   resource_group_name = module.network.resource_group_name
#   dns_prefix          = "labbing"
#   node_count          = 1
#   vm_size             = "Standard_D2_v2"
#   env                 = "DEV"
# }


