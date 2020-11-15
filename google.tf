resource "google_cloud_run_service" "app" {
  name = "cloudrun-srv"
  location = "us-central1"
  project  = var.project_id
  

  template {
    spec {
      containers {
        image = "gcr.io/${var.project_id}/app:b6c3f572f19c96caaaa02f78aefa21a638b49442"
        env {
          name = "LOGZ_TOKEN"
          value = var.logz_token
        }
        env {
          name = "LOGZ_URL"
          value = var.logz_url
        }
        resources {
          limits = {
            memory = "512Mi" # Increased resources to run image of a larger size
          }
        }
      }
    }
  }

  traffic {
    percent = 100
    latest_revision = true
  }
}


data "google_iam_policy" "noauth" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}

resource "google_cloud_run_service_iam_policy" "noauth" {
  location    = google_cloud_run_service.app.location
  project     = google_cloud_run_service.app.project
  service     = google_cloud_run_service.app.name
  policy_data = data.google_iam_policy.noauth.policy_data
}