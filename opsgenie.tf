# Simple provider to handle team, members and "on-alert" rotations.

provider "opsgenie" {
  version = "0.5.2"
  api_url = "api.eu.opsgenie.com"
}

# USERS
resource "opsgenie_user" "userOne" {
  full_name = "test test"
  role = "User"
  username = "test@test.test"
  locale    = "no_NO"
  timezone  = "Europe/Oslo"
}

resource "opsgenie_user" "userTwo" {
  full_name = "test2 test2"
  role = "User"
  username = "test2@test2.test"
  locale    = "no_NO"
  timezone  = "Europe/Oslo"
}

resource "opsgenie_user" "userThree" {
  full_name = "test3 test3"
  role = "User"
  username = "test3@test3.test"
  locale    = "no_NO"
  timezone  = "Europe/Oslo"
}

# TEAM
resource "opsgenie_team" "teamOne" {
  name = "Team 1"

  member {
    id = opsgenie_user.userOne.id
    role = "user"
  }

  member {
    id = opsgenie_user.userTwo.id
    role = "user"
  }

    member {
    id = opsgenie_user.userThree.id
    role = "user"
  }
}

# SCHEDULE & ROTATION
resource "opsgenie_schedule" "schedule" {
  name = "schedule"
  description   = "Schedule for team rotation"
  enabled = true
  timezone      = "Europe/Oslo"
  owner_team_id = opsgenie_team.teamOne.id
}

resource "opsgenie_schedule_rotation" "rotation" {
  name = "rotation"
  schedule_id = opsgenie_schedule.schedule.id
  start_date = "2020-11-21T00:00:00Z"
  type = "hourly"

  participant {
    type = "user"
    id = opsgenie_user.userOne.id
  }

  participant {
    type = "user"
    id = opsgenie_user.userTwo.id
  }

  participant {
    type = "user"
    id = opsgenie_user.userThree.id
  }
}