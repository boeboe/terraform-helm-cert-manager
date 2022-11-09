output "cert_manager_helm_metadata" {
  description = "block status of the cert-manager helm release"
  value = helm_release.cert_manager.metadata
}
