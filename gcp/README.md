# terraform-ark for GCP

Terraform module for Ark for GCP.


## Usage

### Enable Google Cloud APIs

You need to enable the following Google Cloud APIs of your GCP project to run this Terraform module.

* [IAM API](https://console.developers.google.com/apis/api/iam.googleapis.com/overview)
* [Cloud Resource Management](https://console.developers.google.com/apis/api/cloudresourcemanager.googleapis.com/overview)


### Terraform module

Create `main.tf` file with this content.

```terraform

provider "google" {
  project     = "my-project"
  region      = "europe-west1-b"
  credentials = "${file("account.json")}"
}

module "ark_gcp" {
  source = "git::https://github.com/marctc/terraform-ark.git//gcp"

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
