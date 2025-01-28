# Public IP para el Application Gateway
resource "azurerm_public_ip" "app_gateway_pip" {
  name                = "app-gateway-ip"
  location            = var.location
  resource_group_name = azurerm_resource_group.my_rg.name
  allocation_method   = "Static"
  sku = "Standard"
}

# Application Gateway
resource "azurerm_application_gateway" "app_gateway" {
  name                = "my-app-gateway"
  location            = var.location
  resource_group_name = azurerm_resource_group.my_rg.name
  sku {
    name     = "Standard_v2"
    tier     = "Standard_v2"
    capacity = 2
  }

  gateway_ip_configuration {
    name      = "app-gateway-ip-config"
    subnet_id = azurerm_subnet.subnet["application_subnet_gateway"].id
  }

  frontend_port {
    name = "http-port"
    port = 80
  }

  frontend_ip_configuration {
    name                 = "app-gateway-frontend-ip"
    public_ip_address_id = azurerm_public_ip.app_gateway_pip.id
  }

  backend_address_pool {
    name = "backend-pool"
  }

  backend_address_pool {
    name = "frontend-pool"
  }

  http_listener {
    name                           = "http-listener"
    frontend_ip_configuration_name = "app-gateway-frontend-ip"
    frontend_port_name             = "http-port"
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = "frontend-rule"
    rule_type                  = "PathBasedRouting"
    http_listener_name         = "http-listener"
    url_path_map_name          = "url-path-map"
    priority                   = 9
  }

  url_path_map {
    name                               = "url-path-map"
    default_backend_address_pool_name  = "frontend-pool"
    default_backend_http_settings_name = "http-settings"

    path_rule {
      name                       = "frontend-path"
      paths                      = [ "/frontend/*" ]
      backend_address_pool_name  = "frontend-pool"
      backend_http_settings_name = "http-settings"
    }

    path_rule {
      name                       = "backend-path"
      paths                      = [ "/backend/*" ]
      backend_address_pool_name  = "backend-pool"
      backend_http_settings_name = "http-settings"
    }
  }


  backend_http_settings {
    name                  = "http-settings"
    cookie_based_affinity = "Disabled"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 20
  }
}