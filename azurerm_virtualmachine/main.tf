variable "vms" {

}



resource "azurerm_network_security_group" "Block2" {
  name                = "prod-vnet-001-nsg"
  location            = "Japaneast"
  resource_group_name = "rg-prod-vnet-001"

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "HTTP"
    priority                   = 1002
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "HTTP"
    priority                   = 1003
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_public_ip" "example" {
  name                = "acceptanceTestPublicIp1"
  resource_group_name = "rg-prod-vnet-001"
  location            = "japaneast"
  allocation_method   = "Static"

}
# Network Interface
resource "azurerm_network_interface" "Block3" {
  name                = "prod001-nic"
  location            = "japaneast"
  resource_group_name = "rg-prod-vnet-001"
  ip_configuration {
    name                          = "internal"
    subnet_id                     = "/subscriptions/6da16843-2652-4f6e-b550-b4d1a16b30a9/resourceGroups/rg-prod-vnet-001/providers/Microsoft.Network/virtualNetworks/vnet-prod-001/subnets/FrontEnd_subnet_vnet1"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.example.id #implicit dependency

  }
}

resource "azurerm_subnet_network_security_group_association" "Block4" {
  subnet_id                 = "/subscriptions/6da16843-2652-4f6e-b550-b4d1a16b30a9/resourceGroups/rg-prod-vnet-001/providers/Microsoft.Network/virtualNetworks/vnet-prod-001/subnets/FrontEnd_subnet_vnet1"
  network_security_group_id = azurerm_network_security_group.Block2.id
}

resource "azurerm_linux_virtual_machine" "Block5" {

  for_each                        = var.vms
  name                            = each.value.name
  resource_group_name             = each.value.resource_group_name
  location                        = each.value.location
  size                            = each.value.size
  admin_username                  = each.value.admin_username
  admin_password                  = each.value.admin_password
  network_interface_ids           = [azurerm_network_interface.Block3.id]
  disable_password_authentication = "false"


  os_disk {
    name                 = each.value.os_disk_name
    caching              = each.value.os_disk_caching
    storage_account_type = each.value.os_disk_storage_account_type
  }

  source_image_reference {
    publisher = each.value.source_image_publisher
    offer     = each.value.source_image_offer
    sku       = each.value.source_image_sku
    version   = each.value.source_image_version
  }
}
