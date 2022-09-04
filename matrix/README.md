# Matrix Synapse & Element Web

Deploy Matrix homeserver based on Synapse and optionally Element web.

## Table of contents

- [🃏 Features](#-features)
- [🚀 Deploy](#-deploy)
- [📜 Notice](#-notice)

## 🃏 Features

- Ready to deploy synapse image.
- Fully configurable through env variables.
- Customized Element web image.
- Optional Synapse Admin Web Panel (`docker compose --profile tools`).

## 🚀 Deploy

1. Create an `docker-compose.override.yml` file and edit it to suit your needs (*optional*).
2. Edit the `element-config.json` file to suit your needs.
3. Copy `.env.example` to `.env` and edit it accordingly.
4. Generate synapse config (**first time only**): `docker compose run synapse generate && docker compose down`.
5. Run Synapse: `docker compose up -d` or Synapse and Element web: `docker compose --profile element up -d`.

## 📜 Notice

- Remember to generate the synapse config (deploy step 4).
- Some Element endpoints have been changed to **future** self-hosted alternatives (see **element-config.json**).
- Open source Integration Manager: [Dimension](https://github.com/turt2live/matrix-dimension).
- Open source Identify Server: [Gridify Server](https://gitlab.com/kamax-io/software/gridify/server) (or [this](https://github.com/kamax-matrix/mxisd) **deprecated** version).
- Self-hosted Jitsi: [Jitsi Meet](https://github.com/jitsi/jitsi-meet).
