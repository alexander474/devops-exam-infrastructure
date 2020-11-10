terraform {
    backend "gcs" {
        bucket = "stockmanagement-state"
        prefix = "stockmanagement"
        credentials = "terraform.json"
    }
}

provider "google-beta" {
    credentials = file("terraform.json")
    project     = "stockmanagement-294408"
    version = "~> 3.0.0-beta.1"
}