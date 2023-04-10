# Azure-Firewall-

kuch nahi ek resource group create kiya and uske sath ek vnet and subnet and nsg and network interface and virtual machine create kiya (private VM)

uske bad firewall create kiya usko public ip chahiye to public ip create kiya and and subnet chahiye to subnet create kiya uske bad firewall policy create kiya or ab 
firewall create kiya 

uske bad route table create kiya usme thoda configuration crate kiya and associate kr diya subnet ko route table mai


uske bad subse important chize ki jo  hum private virtual machine create kiya tha  uske ssh le sakhte hai and koi particular website search karni hai to wo bhi mention 
kiya security ke liye

azurerm_firewall_policy_rule_collection_group" "rulecollection

nat_rule_collection == for ssh of private virtual machine

application_rule_collection == for particular website run on virtual machine
