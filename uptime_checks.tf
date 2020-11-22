provider "statuscake" {
  version = "1.1.3"
}

resource "statuscake_test" "googlecloudruntest" {
  website_name = "exam"
  website_url = "${google_cloud_run_service.app.status[0].url}/stock" # Check against an endpoint
  test_type = "HTTP"
  check_rate = 300 # How often the check should be runned
  contact_group = ["Default"] # Who should be contacted
}