subnets = {
  "subnet1" = {
    name                 = "FrontEnd_subnet_vnet1"
    resource_group_name  = "rg-prod-vnet-001"
    virtual_network_name = "vnet-prod-001"
    address_prefixes = ["10.0.0.0/27"] }

  "subnet2" = {
    name                 = "BackEnd_subnet_vnet1"
    resource_group_name  = "rg-prod-vnet-001"
    virtual_network_name = "vnet-prod-001"
    address_prefixes     = ["10.0.0.32/28"]
  }
}