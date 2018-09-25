# terraform-ark for GCP

Terraform module for Ark for GCP.

## Usage

```terraform

provider "google" {
  project     = "my-project"
  region      = "europe-west1-b"
  credentials = "${file("account.json")}"
}

module "ark_gcp" {
  source = "gcp"
  
  project      = "my-project"
  bucket_name  = "ark-backup-bucket"
}
```

This will create a file named `credentials-ark` with the decoded content of the service account key in json format.

## Inputs

| Name           | Description                                              |  Type  | Default | Required |
|:---------------|:---------------------------------------------------------|:------:|:-------:|:--------:|
| `project`      | GCE project name                                         | string |    -    |   yes    |
| `role`         | Name of the bucket to store backup data                  | string |    -    |   yes    |

## Outputs

| Name              | Description                                      |
|:------------------|:-------------------------------------------------|
| `email`           | The e-mail address of the service account        |
| `name`            | The fully-qualified name of the service account  |
| `unique_id`       | The unique id of the service account             |
