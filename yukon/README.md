# Yukon

Yukon CPPS Emulator Docker Image

## 🃏 Features

- Almost Plug N' Play!
- Develop without installing node or dependencies.
- Run isolated instances (and multiple instances too!).
- Secured environment.

## 🚀 Deploy

1. Create a `docker-compose.override.yml` file and edit it to suit your needs (***optional***).
2. Copy `.env.example` to `.env` and edit it accordingly.
3. Clone `yukon` and `yukon-server` to `yukon/src` and `yukon-server/src`, respectively.
4. Build `yukon` and copy the contents of the `yukon/src/dist` folder into `www` folder.
5. Copy the contents of the `yukon/src/assets` folder into `www` folder.
6. Copy the contents of the `assets` **repository** into `www` folder.
7. Download a copy of [ruffle self-hosted](https://ruffle.rs/#downloads) and put it into `www/assets/scripts/lib/ruffle` folder.
8. Build `yukon-server`.
9. Run `docker compose up -d`.

```sh
git clone https://github.com/wizguin/yukon.git yukon/src
git clone https://github.com/wizguin/yukon-server.git yukon-server/src
docker compose run node sh -c "cd client && npm i && npm run build && cd ../server && npm i && npm run build"
git clone <assets-repo-url> www/assets
cp -r yukon/src/assets/ www
cp -r yukon/src/dist/* www
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
