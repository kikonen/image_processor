# Simple image processor

Images are uploaded, and then processed asynchrounosly

# Design

- [Architecture](design/architecture.pdf)
- [DB schema](design/db.pdf)

# Development

## Setup
```bash
cp _env .env
cp _development_env .development_env
cp _image_processor_secrets .developmment_secrets

```

## Database setup

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
DOCKER_ENV=production scripts/rails_shell.sh api
rake db:drop db:create db:migrate db:setup
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
