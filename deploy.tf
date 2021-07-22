terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}

  subscription_id = "f016713d-47fd-4917-a2c7-c2805377c59c"
  tenant_id       = "81e2ce42-3c24-4932-8051-c78fcd0d7e78"
}

resource "azurerm_resource_group" "app" {
    name = "app01"
    location = "westus2"
}

resource "azurerm_app_service_plan" "app" {
    name = "AppServicePlan"
    location = azurerm_resource_group.app.location
    resource_group_name = azurerm_resource_group.app.name
    kind = "Linux"
    reserved = true
    sku {
      tier = "Standard"
      size = "S1"
    }
}

resource "azurerm_app_service" "app" {
    name = "aap7776767"
    location = azurerm_resource_group.app.location
    resource_group_name = azurerm_resource_group.app.name
    app_service_plan_id = azurerm_app_service_plan.app.id
    site_config {
    linux_fx_version = "DOTNETCORE|5.0"
    dotnet_framework_version = "v5.0"
}
}
