locals {
  gcp_service_account = jsondecode(var.GOOGLE_APPLICATION_CREDENTIALS)
}

provider "google" {
  project = "cool-furnace-410107"
  region  = "us-central1"
  credentials =  jsonencode(local.gcp_service_account)
}

provider "google" {
  alias   = "project_02"
  project = "poetic-hawk-354105"
  region  = "us-central1"
  credentials =  jsonencode(local.gcp_service_account)
}
