# Matrix

Deploy a Matrix Synapse homeserver and optionally an Element web server.

## 🃏 Features

- Fully configurable through env variables.
- Optional Synapse admin web panel (`docker compose --profile tools`).
- Optional PostgreSQL admin web panel (`docker compose --profile tools`).

## 🚀 Deploy

1. Create an `docker-compose.override.yml` file and edit it to suit your needs (*optional*).
2. Edit the `element-config.json` file to suit your needs.
3. Copy `.env.example` to `.env` and edit it accordingly.
4. Generate synapse config (**first time only**): `docker compose run synapse generate && docker compose down`.
5. Run Synapse: `docker compose up -d` or Synapse and Element web: `docker compose --profile element up -d`.

## 📜 Notes

You can deploy your own open source alternatives of the services used:
- Open source Integration Manager: [Dimension](https://github.com/turt2live/matrix-dimension).
- Open source Identify Server: [Gridify Server](https://gitlab.com/kamax-lu/software/gridify/server) (or [this](https://github.com/kamax-matrix/mxisd) **deprecated** version wich has been forked [here](https://github.com/ma1uta/ma1sd)).
- Self-hosted Jitsi: [Jitsi Meet](https://github.com/jitsi/jitsi-meet).
