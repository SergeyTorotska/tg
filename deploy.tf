provider "azurerm" {
    version = "~>2.0"
    features {}  
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