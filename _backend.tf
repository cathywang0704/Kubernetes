terraform {
  backend "gcs" {
    bucket  = "kubernetes-cluster-302904-terraform-state"
    prefix  = "terraform/state"
  }
}
