variable "project" {}
variable "region" {}
variable "credentials" {}
variable "bucket_name" {}



resource "google_service_account" "heptio_ark_service_account" {
  account_id   = "heptio-ark"
  display_name = "Heptio Ark service account"
}

resource "google_project_iam_custom_role" "heptio_ark_role" {
  role_id     = "heptio_ark.server"
  title       = "Heptio Ark Server"
  permissions = ["compute.disks.get", "compute.disks.create", "compute.disks.createSnapshot", "compute.snapshots.get", 
                "compute.snapshots.create", "compute.snapshots.useReadOnly", "compute.snapshots.delete", "compute.projects.get"]
}

resource "google_project_iam_member" "heptio_ark_iam_binding" {
  role   = "projects/${var.project}/roles/${google_project_iam_custom_role.heptio_ark_role.role_id}"
  member = "serviceAccount:${google_service_account.heptio_ark_service_account.email}"
}

resource "google_service_account_key" "heptio_ark_service_account_key" {
  service_account_id = "${google_service_account.heptio_ark_service_account.name}"
}

resource "local_file" "heptio_ark_service_account_key_json" {
    content     = "${base64decode(google_service_account_key.heptio_ark_service_account_key.private_key)}"
    filename = "${path.module}/credentials-ark"
}

resource "google_storage_bucket" "heptio_ark_bucket" {
  name     = "${var.bucket_name}"
}

resource "google_storage_bucket_iam_member" "member" {
  bucket = "${google_storage_bucket.heptio_ark_bucket.name}"
  role   = "roles/storage.objectAdmin"
  member = "serviceAccount:${google_service_account.heptio_ark_service_account.email}"
}
