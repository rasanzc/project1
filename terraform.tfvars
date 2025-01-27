
#nombre grupo recursos
resource_group_name = "myrg-project1"
location = "West Europe"
tags     = { "env" : "production" }
#virtual network
vnet_name         = "myvnet-project1"
cidr_block        = ["10.0.0.0/16"]
subnets = {
  public_subnet = {
    cidr_block = "10.0.1.0/24"
  }
 
  private_subnet = {
    cidr_block = "10.0.2.0/24"
  }
}

#tamaño disco máquina
vm_size = "Standard_DS1_v2"

security_rules_public = {
  allow_ssh = {
    name                       = "AllowSSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  allow_http = {
    name                       = "AllowHTTP"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

security_rules_private = {
  allow_ssh = {
    name                       = "AllowSSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  allow_http = {
    name                       = "AllowHTTP"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  allow_redis = {
    name                       = "AllowRedis"
    priority                   = 300
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "6379"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
   allow_postgre = {
    name                       = "AllowPostgre"
    priority                   = 400
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "5432"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
 
vm_instance_vote={
  name = "vmvotes"
}
vm_instance_result={
  name = "vmresult"
}

vm_instance_db={
  name = "vmdb"
}

admin_username="azureuser"
admin_password="AzureUser2024"
