variable "rg_names" {}

resource "azurerm_resource_group" "Block1" {
  for_each = var.rg_names
  name     = each.value.name
  location = each.value.location
}