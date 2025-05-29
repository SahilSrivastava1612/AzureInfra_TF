storageaccounts = {
  "storage1" = {
    name                     = "stprod001foreach"
    location                 = "Japan East"
    account_tier             = "Standard"
    resource_group_name      = "rg-prod-vnet-001"
    account_replication_type = "LRS"
  }

  "storage2" = {
    name                     = "stprod002foreach"
    location                 = "West US"
    account_tier             = "Standard"
    resource_group_name      = "rg-prod-vnet-002"
    account_replication_type = "GRS"
  }
}