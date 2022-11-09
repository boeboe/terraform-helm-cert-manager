locals {
  cert_manager_version        = var.cert_manager_version
  cert_manager_helm_namespace = var.cert_manager_helm_namespace
  cert_manager_helm_repo      = var.cert_manager_helm_repo

  cert_manager_settings = var.cert_manager_settings
}

resource "helm_release" "cert_manager" {
  name             = "cert-manager"
  repository       = local.cert_manager_helm_repo
  chart            = "cert-manager"
  version          = local.cert_manager_version
  create_namespace = true
  namespace        = local.cert_manager_helm_namespace

  dynamic "set" {
    for_each = local.cert_manager_settings
    content {
      name  = set.key
      value = set.value
    }
  }
}
