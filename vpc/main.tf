module "autoscaling" {
  source    = "./moules/autoscaling"
  namespace = var.namespace
}

module "database" {
  source    = "./molues/database"
  namespace = var.namespace
}

module "networking" {
  source    = "./modules/networking"
  namespace = var.namespace
}