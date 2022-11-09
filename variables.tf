variable "cert_manager_version" {
  description = "cert-manager version"
  type        = string
}

variable "cert_manager_helm_namespace" {
  description = "cert-manager helm namespace"
  type        = string
  default     = "cert-manager"
}

variable "cert_manager_helm_repo" {
  description = "cert-manager helm repository"
  type        = string
  default     = "https://charts.jetstack.io"
}


variable "cert_manager_settings" {
  description = "cert-manager settings"
  type        = map
  default     = {}
}
