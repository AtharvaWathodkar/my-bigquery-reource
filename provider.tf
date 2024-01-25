provider "google" {
  project = "cool-furnace-410107"
  region  = "us-central1"
  credentials = "cool-furnace-410107-3cafbcf95099.json"
}

provider "google" {
  alias   = "project_02"
  project = "poetic-hawk-354105"
  region  = "us-central1"
  credentials = "cool-furnace-410107-3cafbcf95099.json"
}
