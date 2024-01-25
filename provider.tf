provider "google" {
  project = "cool-furnace-410107"
  region  = "us-central1"
}

provider "google" {
  alias   = "project_02"
  project = "poetic-hawk-354105"
  region  = "us-central1"
}
