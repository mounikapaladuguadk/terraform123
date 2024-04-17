


 resource "azurerm_virtual_network" "vnet" {
  name                = var.azurerm_virtual_network-name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = var.address_space
  dns_servers         = var.dns_servers 
 }


 resource "azurerm_subnet" "snet" {
  name                 = var.azurerm_subnet-name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.address_prefixes 
 }

 
resource "azurerm_network_security_group" "nsg" {
  name                = var.azurerm_network_security_group-name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
    name                       = var.security_rule-name
    priority                   = var.priority 
    direction                  = var.direction 
    access                     = var.access 
    protocol                   = var.protocol  
    source_port_range          = var.source_port_range  
    destination_port_range     = var.destination_port_range
    source_address_prefix      = var.source_address_prefix
    destination_address_prefix = var.destination_address_prefix
  }

  tags = {
    environment = "Production"
  }
}
