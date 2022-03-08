# fosscord

Fosscord Server Development Docker

## Table of contents

- [🃏 Features](#-features)
- [🚀 Deploy](#-deploy)
- [📜 Notice](#-notice)

## 🃏 Features

- Fosscord Server mounted on Docker Volumes.
- Develop without installing dependencies.
- Optional dev mode initialization

## 🚀 Deploy

1. Edit the `docker-compose.yaml` file to suit your needs.
2. Copy `.env.example` to `.env` and edit it accordingly.
3. Run `docker-compose up -d`.

## 📜 Notice

- MariaDB integration is not working properly at the moment. For this reason, the mariadb container is disabled.
- If you wish to use Docker bind mount, see the commented volume in `docker-compose.yaml`.
