resource "google_bigquery_dataset" "project_01_dataset" {
  dataset_id = "project_01_dataset"
}

resource "google_bigquery_dataset" "project_02_dataset" {
  provider = google.project_02
  dataset_id = "project_02_dataset"
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
    query = replace("SELECT * FROM `${google_bigquery_table.project_02_table.project}.${google_bigquery_table.project_02_table.dataset_id}.${google_bigquery_table.project_02_table.table_id}`;", "`", "\\`")
    use_legacy_sql = false
  }
}
