# Kubernetes

This project will create a Kubernetes cluster in GCP ("Google Cloud Platform") using their managed service called GKE ("Google Kubernetes Engine").

## Goal

A school project to create a Kubernetes cluster that illustrates how to create the cluster, deploying an example application, and explaining any learnings.

Implicit goals:

- Automate the setup and configuration of the Kubernetes cluster.
- Automate the deployment of the example application.

## Prerequisites

- IDE (Note: VS Code is a good option)
- GCP Project
- source control repo
- bash
- [terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)
- [gcloud](https://cloud.google.com/sdk/docs/install)
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
- kubectx/kubens
- ...

## Setup

1. Create a [GCP project](https://console.cloud.google.com/)

2. Replace `variables.tf` values with your `project_id` and `region`. Your `project_id` must match the project you've initialized gcloud with. To change your `gcloud` settings, run `gcloud init`. The region has been defaulted to `australia-southeast1`; you can find a full list of gcloud regions [here](https://cloud.google.com/compute/docs/regions-zones).

After you've done this, initalize your Terraform workspace, which will download the provider and initialize it with the values provided in the `variables.tf` file.

```bash
$ terraform init

Initializing the backend...

Initializing provider plugins...
- Checking for available provider plugins...
- Downloading plugin for provider "google" (hashicorp/google) 3.13.0...
Terraform has been successfully initialized!
```

To see what the terraform configuration will create in your GCP project you may wish to run `terraform plan`

Then, provision your GKE cluster by running `terraform apply`.

```bash
$ terraform apply

# Output truncated...

Plan: 4 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

# Output truncated...

Apply complete! Resources: 4 added, 0 changed, 0 destroyed.

Outputs:

kubernetes_cluster_name = kubernetes-cluster-gke
region = us-central1
```

If you wish to shutdown your Kubernetes cluster simply run the following command:

```bash
terraform destroy
```

## Configure kubectl

Configure kubetcl, by running the following command:

```bash
gcloud container clusters get-credentials kubernetes-cluster-gke --region us-central1
```

The [Kubernetes Cluster Name](variables.tf#L16) and [Region](variables.tf#L6) correspond to the resources spun up by Terraform.

Notes:

- Visual Studio Code
