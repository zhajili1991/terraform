resource "azurerm_resource_group" "bguliyev-lab" {
  name     = var.resource_group_name
  location = var.location

  tags = {
    purpose  = var.purpose
    location = var.location_tag
    env      = var.env
  }
}