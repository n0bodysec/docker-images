# Brave Sync

Self-hosted lightweight [Brave Sync Server](https://github.com/brave/go-sync) Docker image.
> Based on the [original Docke script](https://github.com/brave/go-sync/blob/master/docker-compose.yml).

## Table of contents

- [🃏 Features](#-features)
- [🚀 Deploy](#-deploy)
- [📜 Notice](#-notice)

## 🃏 Features

- Custom lightweight docker image ([compare](https://github.com/brave/go-sync/blob/master/Dockerfile)).
- Use go-sync source code from host (docker mounted volume).
- No *dev* container (*go* container can be used for all purposes).
- Expose only one required port thanks to the Docker network.

## 🚀 Deploy

1. Clone this repo and `cd` to it: `git clone ... && cd docker-images/brave-sync`.
2. Clone **go-sync** source code: `git clone https://github.com/brave/go-sync data/src`.
3. (**Optional**) Edit the `docker-compose.yml` file to suit your needs.
4. (**Optional**) Copy `.env.example` to `.env` and edit it accordingly.
5. Run `docker compose up -d`.
6. (**First time only**) run `docker exec -it brave-sync sh -c 'aws dynamodb create-table --cli-input-json file:///srv/go-sync/schema/dynamodb/table.json --endpoint-url "$AWS_ENDPOINT" --region "$AWS_REGION"'`.

## 📜 Notice

- This Docker script was not intensively tested. Expect some bugs.
