# container registry

resource "azurerm_container_registry" "zhajiliacr" {
  name                = "zhajiliacr"
  resource_group_name = azurerm_resource_group.zhajili-lab.name
  location            = azurerm_resource_group.zhajili-lab.location
  sku                 = "Premium"
  admin_enabled       = false
  tags = {
  environment = "develop"
  location = "Krakow"
  }
}