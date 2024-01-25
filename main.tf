resource "google_bigquery_dataset" "project_01_dataset" {
    dataset_id = "project_01_dataset"
    default_table_expiration_ms = 60 * 24 * 60 * 60 * 1000 # 60 days in milliseconds
        deletion_protection=false
  }
  
  resource "google_bigquery_dataset" "project_02_dataset" {
    provider = google.project_02
    dataset_id = "project_02_dataset"
    default_table_expiration_ms = 60 * 24 * 60 * 60 * 1000 # 60 days in milliseconds
       deletion_protection=false
  }
  
  resource "google_bigquery_table" "project_02_table" {
    provider   = google.project_02
    dataset_id = google_bigquery_dataset.project_02_dataset.dataset_id
    table_id   = "project_02_table"
    schema = <<EOF
  [
    {
      "name": "column1",
      "type": "STRING",
      "mode": "NULLABLE"
    },
    {
      "name": "column2",
      "type": "INTEGER",
      "mode": "NULLABLE"
    }
  ]
  EOF
  }
  
  resource "google_bigquery_table" "project_01_view" {
    dataset_id = google_bigquery_dataset.project_01_dataset.dataset_id
    table_id   = "project_01_view"
    view {
      query          = "SELECT * FROM `${google_bigquery_table.project_02_table.project}.${google_bigquery_table.project_02_table.dataset_id}.${google_bigquery_table.project_02_table.table_id}`"
      use_legacy_sql = false
    }
  }
