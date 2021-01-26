terraform {
  backend "gcs" {
    bucket = "kubernetes-terraform-state"
    prefix = "terraform/state"
  }
}
