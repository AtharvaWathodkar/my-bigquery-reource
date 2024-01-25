provider "google" {
  project = "cool-furnace-410107"
  region  = "us-central1"
}

provider "google" {
  alias   = "project_02"
  project = "brave-attic-354107"
  region  = "us-central1"
}

resource "google_bigquery_dataset" "project_01_dataset" {
  dataset_id = "project_01_dataset"
}

resource "google_bigquery_table" "project_01_view" {
  dataset_id = google_bigquery_dataset.project_01_dataset.dataset_id
  table_id   = "project_01_view"
  view {
    query          = "SELECT * FROM \`project-02.project_02_dataset.project_02_table\`;"
    use_legacy_sql = false
  }
}
