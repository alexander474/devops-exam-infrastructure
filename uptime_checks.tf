provider "statuscake" {
  username = "alexanderbredesen98gmailcom"
}

resource "statuscake_test" "google" {
  website_name = "exam"
  website_url = google_cloud_run_service.app.status[0].url
  test_type = "HTTP"
  check_rate = 300
  contact_group = ["Default"]
}