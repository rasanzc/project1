variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "tags" {
  type = map(any)
}

variable "vnet_name" {
  type = string
}

variable "cidr_block" {

  type    = list(string)
  default = ["10.0.0.0/16"]

}

variable "subnets" {
  type = any
}

variable "security_rules_public" {
  type = map(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))
}

variable "security_rules_private" {
  type = map(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))
}


variable "vm_instance_vote" {
  type = any
}

variable "vm_instance_result" {
  type = any
}

variable "vm_instance_db" {
  type = any
}

variable "vm_size" {
  type    = string
  default = "Standard_DS1_v2"
}

variable  "admin_username" {
  type = string
}

variable "admin_password" {
  type = string
}