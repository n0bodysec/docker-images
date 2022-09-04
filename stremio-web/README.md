# stremio-web

Docker image for stremio-server (no-cors) and stremio-web.

Feel free to edit the `docker-compose.yml` to update the webpack port.

## Table of contents

- [🃏 Features](#-features)
- [🚀 Deploy](#-deploy)
- [📜 Notice](#-notice)

## 🃏 Features

- Stremio Server (fixed CORS).
- Stremio Web Player.

## 🚀 Deploy

1. Edit the `docker-compose.yml` file to suit your needs (e.g. webpack port).
2. Run `docker compose up -d`.

## 📜 Notice

If you change the webpack port, remember to update the exposed docker port as well.
