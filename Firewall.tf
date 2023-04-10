resource "azurerm_public_ip" "firewall-ip" {
  name                = "firewall-ip"
  resource_group_name = azurerm_resource_group.vijay.name
  location            = azurerm_resource_group.vijay.location
  allocation_method   = "Static"
  sku = "Standard"
  sku_tier = "Regional"
}

# we need an additional subnet in the virtual network

resource "azurerm_subnet" "firewall-sub" {
  name                 = "AzureFirewallSubnet"
  resource_group_name  = azurerm_resource_group.vijay.name
  virtual_network_name = azurerm_virtual_network.firewallvirtualnetwork.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_firewall_policy" "firewallpolicy" {
  name                = "firewallpolicy"
  resource_group_name = azurerm_resource_group.vijay.name
  location            = azurerm_resource_group.vijay.location
}

resource "azurerm_firewall" "firewall" {
  name                = "AzureFirewall-vijay"
  location            = azurerm_resource_group.vijay.location
  resource_group_name = azurerm_resource_group.vijay.name
  sku_name            = "AZFW_VNet"
  sku_tier            = "Standard"

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.firewall-sub.id
    public_ip_address_id = azurerm_public_ip.firewall-ip.id
  }

  firewall_policy_id = azurerm_firewall_policy.firewallpolicy.id

  depends_on = [
    azurerm_firewall_policy.firewallpolicy
  ]

}
