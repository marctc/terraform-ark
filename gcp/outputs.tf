output "email" {
  value       = "${google_service_account.heptio_ark_service_account.email}"
  description = "The e-mail address of the service account."
}

output "name" {
  value       = "${google_service_account.heptio_ark_service_account.name}"
  description = "The fully-qualified name of the service account."
}

output "unique_id" {
  value       = "${google_service_account.heptio_ark_service_account.unique_id}"
  description = "The unique id of the service account."
}