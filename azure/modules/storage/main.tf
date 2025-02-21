#storage account configuration
resource "azurerm_storage_account" "krakowtfstfiles" {
  name                     = "${var.storage_account_prefix}tfstfiles"
  resource_group_name = azurerm_resource_group.zhajili-lab.name
  location                 = azurerm_resource_group.zhajili-lab.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags = {
    environment = "develop"
  }
}

resource "azurerm_storage_account" "krakowlabstorage" {
  name                     = "${var.storage_account_prefix}labstorage"
  resource_group_name = azurerm_resource_group.zhajili-lab.name
  location                 = azurerm_resource_group.zhajili-lab.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags = {
    environment = "develop"
  }
}

# storage containers
resource "azurerm_storage_container" "statecontainer" {
  name                  = "statefiles"
  storage_account_name = azurerm_storage_account.krakowtfstfiles.name
  container_access_type = "private"
}

resource "azurerm_storage_container" "krakowlabcontainer" {
  name                  = "krakowlabcontainer"
  storage_account_name = azurerm_storage_account.krakowlabstorage.name
  container_access_type = "private"
}

# storage account network rules
resource "azurerm_storage_account_network_rules" "statestoragerules" {
  storage_account_id = azurerm_storage_account.krakowtfstfiles.id
  default_action             = "Allow"
  # ip_rules                   = ["89.64.65.216/30","173.38.220.34/30"]
  bypass                     = ["Metrics"]
}

resource "azurerm_storage_account_network_rules" "krakowlabstoragerules" {
  storage_account_id = azurerm_storage_account.krakowlabstorage.id
  default_action             = "Allow"
  # ip_rules                   = ["89.64.65.216/30","173.38.220.34/30"]
  bypass                     = ["Metrics"]
}

# storage fileshare

resource "azurerm_storage_share" "krakowlabstorageshare" {
  name                 = "krakowlabstorageshare"
  storage_account_name = azurerm_storage_account.krakowlabstorage.name
  quota                = 50
}
