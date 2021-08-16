# Define Local Values in Terraform
locals {
  owners = var.business_division //the Bussiness division variable.
  environment = var.environment // The defined environment variable
  name = "${var.business_division}-${var.environment}" //This will be the name owners + environment
  #name = "${local.owners}-${local.environment}" //You can use this format too.
  common_tags = { //Some tags
    owners = local.owners
    environment = local.environment
  }
} 