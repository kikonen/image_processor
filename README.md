# Simple image processor

Images are uploaded, and then processed asynchrounosly

## Demo

[Image processor](https://image.ikari.fi/ui)

# Design

- [Architecture](design/architecture.pdf)
- [DB schema](design/db.pdf)

# Project structure

## Repositories
- [Deployment (this)](https://github.com/kikonen/image_processor)
- [API](https://github.com/kikonen/image_processor_api)
- [UI](https://github.com/kikonen/image_processor_ui)
- [Authentication (TBD!)](https://github.com/kikonen/image_processor_auth)
- [Worker](https://github.com/kikonen/image_processor_worker)

## Pending (known) issues
- [Issues](https://github.com/kikonen/image_processor/issues)

# Development

## Setup
```bash
cp _env .env
cp _development_env .development_env
cp _image_processor_secrets .development_secrets

```

## Database setup

```bash
cd image_processor
scripts/development_run.sh api bash -c "rake db:drop db:create db:migrate db:setup"
docker container prune
```

or via shell session
```bash
cd image_processor
scripts/rails_shell.sh api
rake db:drop db:create db:migrate db:setup
```

## Build

```bash
cd image_processor
scripts/development_build.sh
```

## Run

```bash
cd image_processor
scripts/development_up.sh ui

http://localhost:8121/ui
```

## Base build

```bash
cd image_processor
scripts/base_build.sh
scripts/base_tag.sh x.y
scripts/base_push.sh x.y
```
**NOTE** update .env with "BASE_TAG=x.y"


## Production build

```bash
cd image_processor
scripts/production_build.sh
scripts/production_tag.sh x.y
scripts/production_push.sh x.y
```

**NOTE** update .env with "BUILD_TAG=x.y"

## Production database initial setup

```bash
cd image_processor
scripts/production_run.sh api bash -c "cd /home/app/webapp && rake db:drop db:create db:migrate db:setup && rm log/production.log"
docker container prune
```

## Create fake token

For a moment since auth is not implemented
```bash
# start API
scripts/production_up.sh api

# fetch example user
curl "http://localhost:8122/api/tests/users"
curl "https://image.ikari.fi/api/tests/users"

# ID from previous
curl "http://localhost:8122/api/tests/token?id=d5383073-255a-40e3-916f-0ad321b90f66"
curl "https://image.ikari.fi/api/tests/token?id=d5383073-255a-40e3-916f-0ad321b90f66"

# save token
cat >.production_secrets/fake_token
eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyIjoiZDRkYmEwODYtOWYyNy00NWU5LWFlYWItMWNjODJiZjQzZTE1IiwiZXhwIjoxNjUwMzk5MTE5fQ.xf4CRtThz2dTpjdU4_JwfiumdoWybGJQhknPppggyYc
```

## Production run

```bash
cd image_processor
scripts/production_up.sh -d
```

# References

## Rails
- https://guides.rubyonrails.org/api_app.html
- https://www.wyeworks.com/blog/2016/01/12/improvements-to-error-responses-in-rails-5-api-mode/
- https://github.com/taf2/curb
- https://smartlogic.io/blog/permitting-nested-arrays-using-strong-params-in-rails/
- https://guides.rubyonrails.org/active_model_basics.html
- https://stackoverflow.com/questions/13537920/ruby-split-by-whitespace
- https://medium.com/@jenn.leigh.hansen/google-oauth2-for-rails-ba1bcfd1b863
- https://github.com/omniauth/omniauth
- https://github.com/rails/rails/issues/26180
- https://github.com/rails/rails/issues/39366
- https://github.com/rails/rails/issues/22965
- https://github.com/cookpad/omniauth-rails_csrf_protection/issues/8

## JWT
- https://medium.com/binar-academy/rails-api-jwt-authentication-a04503ea3248
- https://github.com/jwt/ruby-jwt

## Images
- https://www.sciencedirect.com/topics/computer-science/exchangeable-image-file-format
- https://github.com/tonytonyjan/exif
- https://stackoverflow.com/questions/8635578/how-to-check-whether-the-character-is-utf-8
- https://stackoverflow.com/questions/16530038/how-to-remove-non-printable-invisible-characters-in-ruby

## Docker
- https://stackoverflow.com/questions/65765439/http-origin-header-https-myapp-com-didnt-match-request-base-url-http-mya
