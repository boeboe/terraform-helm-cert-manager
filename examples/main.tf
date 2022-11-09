locals {
  kubeconfig_path = "~/.kube/config"

  cert_manager_version = "1.10.0"

  cert_manager_settings = {
    "installCRDs"                             = "true"
    "podAnnotations.custom\\.annotation\\.io" = "test"
    "podAnnotations.environment"              = "test"
  }
}

provider "kubernetes" {
  config_path = local.kubeconfig_path
}

provider "helm" {
  kubernetes {
    config_path = local.kubeconfig_path
  }
}

module "cert_manager" {
  source = "./.."

  cert_manager_version  = local.cert_manager_version
  cert_manager_settings = local.cert_manager_settings
}

output "cert_manager_helm_metadata" {
  description = "block status of the cert-manager helm release"
  value       = module.cert_manager.cert_manager_helm_metadata[0]
}
