vnets = {
  vnet1 = {
    name                = "vnet-prod-001"
    location            = "Japan East"
    resource_group_name = "rg-prod-vnet-001"
    address_space       = ["10.0.0.0/16"]
  }
  vnet2 = {
    name                = "vnet-prod-002"
    location            = "West US"
    resource_group_name = "rg-prod-vnet-002"
    address_space       = ["10.0.0.0/16"]
  }
}