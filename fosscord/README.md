# fosscord

Fosscord Server Development Docker

## Table of contents

- [🃏 Features](#-features)
- [🚀 Deploy](#-deploy)
- [📜 Notice](#-notice)

## 🃏 Features

- Develop without installing dependencies.
- Run isolated instances (and multiple instances too!).
- Secured environment.

## 🚀 Deploy

1. Create a `docker-compose.override.yml` file and edit it to suit your needs (***optional***).
2. Copy `.env.example` to `.env` and edit it accordingly.
3. Clone `fosscord-server` into `data/fosscord/src`.
5. Run `docker compose run fosscord sh ../scripts/update.sh` or setup Fosscord manually.
6. Run `docker compose up -d`.

**Please note that to run the PostgreSQL or MariaDB container, you must specify its compose file.**  
Example: `docker compose -f docker-compose.yml -f docker-compose.postgres.yml up -d`.

```sh
git clone https://github.com/n0bodysec/docker-images.git
cd docker-images/fosscord/
cp .env.example .env
git clone https://github.com/fosscord/fosscord-server.git data/fosscord/src/
docker compose run fosscord sh ../scripts/update.sh
docker compose up -d
```

## 📜 Notice

- Fosscord is not working properly with MariaDB at this moment. Please use PostgreSQL or SQLite instead.
- It is possible to use docker named volumes instead of bind mount, but you need to edit `docker-compose.override.yml` accordingly.
