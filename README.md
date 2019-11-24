# terraform-ark (DEPRECATED)
_This project is no longer maintained. The original tool is renamed to [Velero](https://velero.io/)and they improved they way to [install it](https://velero.io/docs/v1.2.0/install-overview/) in your cluster._

Terraform module to create custom roles, service account and bucket binding for [Heptio Ark](https://heptio.github.io/ark) disaster recovery tool.

## Usage example for GCP

Create `main.tf` file with this content.

```terraform
provider "google" {
  project     = "my-project"
  region      = "europe-west1-b"
  credentials = "${file("account.json")}"
}

module "ark_gcp" {
  source = "git::https://github.com/marctc/terraform-velero.git//gcp"
  
  project      = "my-project"
  bucket_name  = "velero-backup-bucket"
}
```
Then run:

```
$ terraform init
$ terraform plan
$ terraform apply
```
