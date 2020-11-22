# devops-exam-infrastructure
<a href="https://www.statuscake.com" title="Website Uptime Monitoring"><img src="https://app.statuscake.com/button/index.php?Track=5742658&Days=1&Design=1" /></a>
[![Build Status](https://travis-ci.com/alexander474/devops-exam-infrastructure.svg?token=Jcye5ttDhAMRpUM3Ca28&branch=master)](https://travis-ci.com/alexander474/devops-exam-infrastructure)

# Set secrets

```sh
> travis encrypt LOGZ_TOKEN=<your_key> --add

> travis encrypt LOGZ_URL=<your_key> --add

> travis encrypt STATUSCAKE_APIKEY=<your_key> --add

> travis encrypt STATUSCAKE_USERNAME=<your_username> --add

> travis encrypt OPSGENIE_API_KEY=<your_key> --add
```