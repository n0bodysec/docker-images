# fosscord

Plug-and-Play installation of Fosscord. You can choose between two available images.

## 🃏 Features

- Start your own instance with no effort.
- Isolated instances.
- Multiple instances support.
- Secured environment.

## 🚀 Deploy (production)

1. Edit the `.env` file to suit your needs.
> You **MUST** set `STORAGE_LOCATION` and `DATABASE` (if using SQLite) env vars to the following, if you are planning to use this deployment method.

```
STORAGE_LOCATION=/app/data/files
DATABASE=/app/data/db.sqlite
```

2. Run the following command to start a ready to use instance. The image automatically downloads and setup the latest version of Fosscord.

```sh
docker compose -f .docker/base.yml -f .docker/production.yml up -d
```

> To update your Fosscord instance or the base image, you MUST re-build the image.

## 🚀 Deploy (development)

If you prefer to setup the server manually, or want to use a custom version, you should choose this method instead. You will build a base image that contains the minimum requirements to run, then you can build Fosscord manually or you can run the built-in configuration script!

1. Edit the `.env` file to suit your needs.
2. Run the following commands:
```sh
docker compose -f .docker/base.yml -f .docker/development.yml build
docker compose -f .docker/base.yml -f .docker/development.yml run setup
docker compose -f .docker/base.yml -f .docker/development.yml up -d
```

## ❓ MariaDB and PostgreSQL

You can deploy both production and development images using MariaDB or PostgreSQL instead of the built-in SQLite database. To do this, add `-f .docker/mariadb.yml` or `-f .docker/postgres.sql` to all your docker compose commands.

Example: `docker compose -f .docker/base.yml -f .docker/production.yml -f .docker/postgres.yml up -d`

## 📜 Notes

- Remember to update your .env file.
