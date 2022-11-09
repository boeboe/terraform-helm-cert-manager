# terraform-helm-cert-manager

![Terraform Version](https://img.shields.io/badge/terraform-≥_1.0.0-blueviolet)
[![GitHub tag (latest SemVer)](https://img.shields.io/github/v/tag/boeboe/terraform-helm-cert-manager?label=registry)](https://registry.terraform.io/modules/boeboe/cert-manager/helm)
[![GitHub issues](https://img.shields.io/github/issues/boeboe/terraform-helm-cert-manager)](https://github.com/boeboe/terraform-helm-cert-manager/issues)
[![Open Source Helpers](https://www.codetriage.com/boeboe/terraform-helm-cert-manager/badges/users.svg)](https://www.codetriage.com/boeboe/terraform-helm-cert-manager)
[![MIT Licensed](https://img.shields.io/badge/license-MIT-green.svg)](https://tldrlegal.com/license/mit-license)

This terraform module will deploy [cert-manager](https://cert-manager.io) on any kubernetes cluster, using the official [helm charts](https://artifacthub.io/packages/helm/cert-manager/cert-manager).

| Helm Chart | Repo | Default Values |
|------------|------|--------|
| cert-manager | [repo](https://artifacthub.io/packages/helm/cert-manager/cert-manager) | [values](https://artifacthub.io/packages/helm/cert-manager/cert-manager?modal=values) |


## Usage

``` hcl
provider "kubernetes" {
  config_path    = "~/.kube/config"
}

provider "helm" {
  kubernetes {
    config_path    = "~/.kube/config"
  }
}

module "cert_manager" {
  source  = "boeboe/cert-manager/helm"
  version = "0.0.1"

  cert_manager_version = "1.10.0"

  cert_manager_settings = {
    "installCRDs"                             = "true"
    "podAnnotations.custom\\.annotation\\.io" = "test"
    "podAnnotations.environment"              = "test"
  }
}

output "cert_manager_helm_metadata" {
  description = "block status of the cert-manager helm release"
  value = module.cert_manager.cert_manager_helm_metadata[0]
}
```

Check the [examples](examples) for more details.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| cert_manager_version | cert-manager version | string | - | true |
| cert_manager_helm_namespace | cert-manager helm namespace | string | "cert-manager" | false |
| cert_manager_helm_repo | cert-manager helm repository | string | "https://charts.jetstack.io" | false |
| cert_manager_settings | cert-manager settings | map | {} | false |

## Outputs

| Name | Description | Type |
|------|-------------|------|
| cert_manager_helm_metadata | block status of the cert-manager helm release | list |


Example output:

``` hcl
cert_manager_helm_metadata = {
  "app_version" = "v1.10.0"
  "chart" = "cert-manager"
  "name" = "cert-manager"
  "namespace" = "cert-manager"
  "revision" = 1
  "values" = "{\"installCRDs\":true,\"podAnnotations\":{\"custom.annotation.io\":\"test\",\"environment\":\"test\"}}"
  "version" = "v1.10.0"
}
```

## More information

TBC

## License

terraform-helm-cert-manager is released under the **MIT License**. See the bundled [LICENSE](LICENSE) file for details.
