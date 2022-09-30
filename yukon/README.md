# Yukon

Yukon CPPS Emulator Docker Image

## 🃏 Features

- Almost Plug n' Play!
- Develop without installing node or dependencies.
- Run isolated instances (and multiple instances too!).
- Secured environment.

## 🚀 Deploy (automatic setup)

If you want to deploy Yukon with almost no effort, follow the next steps:

1. Copy `.env.example` to `.env` and edit it accordingly.
	> Please make sure to set **ASSETS_TAR_URL** correctly.
2. Run `docker compose up -d`.

```sh
cp .env.example .env
docker compose up builder
docker compose up -d
```

## 🚀 Deploy (manual setup)

If you prefer to clone the sources and build it manually, you can follow the next steps:

1. Create a `docker-compose.override.yml` file and edit it to suit your needs (***optional***).
2. Copy `.env.example` to `.env` and edit it accordingly.
3. Clone `yukon` and `yukon-server` to `client/src` and `server/src`, respectively.
4. Build `yukon` and copy the contents of the `client/src/dist` folder into `www` folder.
5. Copy the contents of the `client/src/assets` folder into `www` folder.
6. Copy the contents of the `assets` **repository** into `www` folder.
7. Download a copy of [ruffle self-hosted](https://ruffle.rs/#downloads) and put it into `www/assets/scripts/lib/ruffle` folder.
8. Build `yukon-server`.
9. Run `docker compose up -d`.

```sh
cp .env.example .env
git clone https://github.com/wizguin/yukon.git client/src
git clone https://github.com/wizguin/yukon-server.git server/src
docker compose run node sh -c "cd client && npm i && npm run build && cd ../server && npm i && npm run build"
git clone <assets-repo-url> www/assets
cp -r client/src/assets/ www
cp -r client/src/dist/* www
mkdir -p www/assets/scripts/lib/ruffle
wget -qO- https://github.com/ruffle-rs/ruffle/releases/download/nightly-2022-09-14/ruffle-nightly-2022_09_14-web-selfhosted.zip | busybox unzip -d www/assets/scripts/lib/ruffle -
docker compose up -d
```

## 👍 Acknowledgements

- [wizguin](https://github.com/wizguin/) - Yukon Developer.
- [Solero Team](https://github.com/solero/) - For their [.env syntax](https://github.com/solero/wand/blob/master/.env).

## 📜 Notes

- Remember to update your .env file.
- The PHP docker image is not included. If you want to use the default register script (**not recommended**), add the image yourself and update the `templates/yukon.conf.template` file as well.
