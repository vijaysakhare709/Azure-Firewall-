resource "azurerm_route_table" "firewallroutetable" {
  name                          = "firewallroutetable"
  location                      = azurerm_resource_group.vijay.location
  resource_group_name           = azurerm_resource_group.vijay.name
  disable_bgp_route_propagation = true

  depends_on = [
    azurerm_resource_group.vijay
  ]
}

resource "azurerm_route" "firewallroute" {
  name                = "firewallroute"
  resource_group_name = azurerm_resource_group.vijay.name
  route_table_name    = azurerm_route_table.firewallroutetable.name
  address_prefix      = "0.0.0.0/0"
  next_hop_type       = "VirtualAppliance"
  next_hop_in_ip_address = azurerm_firewall.firewall.ip_configuration[0].private_ip_address

  depends_on = [
    azurerm_route_table.firewallroutetable
  ]
}

resource "azurerm_subnet_route_table_association" "subnetassociation" {
  subnet_id      = azurerm_subnet.virtualsubnet1.id
  route_table_id = azurerm_route_table.firewallroutetable.id
}
