vms = {
  "vm1" = {
    name                         = "vmlinprod001"
    resource_group_name          = "rg-prod-vnet-001"
    location                     = "Japaneast"
    size                         = "Standard_A1_v2"
    admin_username               = "AzureAdmin"
    admin_password               = "p@ssw0rd123"
    os_disk_name                 = "osdisk-vmlinprod001"
    os_disk_caching              = "ReadWrite"
    os_disk_storage_account_type = "Standard_LRS"
    source_image_publisher       = "Canonical"
    source_image_offer           = "0001-com-ubuntu-server-jammy"
    source_image_sku             = "22_04-lts"
    source_image_version         = "latest"
  }
}