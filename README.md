# terraform-ark

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
  source = "git::https://github.com/marctc/terraform-ark/gcp"
  
  project      = "my-project"
  bucket_name  = "ark-backup-bucket"
}
```
Then run:

```
$ terraform init
$ terraform plan
$ terraform apply
```
