terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
    google-beta = {
      source = "hashicorp/google-beta"
    }
    statuscake = {
      source = "terraform-providers/statuscake"
    }
    opsgenie = {
      source = "terraform-providers/opsgenie"
    }
  }
  required_version = ">= 0.13"
}
