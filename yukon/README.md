# Yukon

Yukon is an HTML5 CPPS written in JavaScript. This repository contains a series of Docker compose services to help you develop and deploy Yukon faster and more securely.

## 🃏 Features

- Plug n' Play deployment!
- Develop without installing node or dependencies.
- Isolated instances.
- Multiple instances support.
- Secured environment.

## 🚀 Deploy

If you want to deploy Yukon with almost no effort, follow the next steps:

1. Copy `.env.example` to `.env` and edit it accordingly.
	> Please make sure to set **ASSETS_REPOSITORY** correctly.
2. Run the `setup` compose service.
3. Run `docker compose up -d`.

```sh
cp .env.example .env
docker compose up setup
docker compose up -d
```

## 👍 Acknowledgements

- [wizguin](https://github.com/wizguin/) - Yukon Developer.
- [Solero Team](https://github.com/solero/) - For their [.env syntax](https://github.com/solero/wand/blob/master/.env).

## 📜 Notes

- Remember to update your .env file.
- The PHP docker image is not included. If you want to use the default register script (**not recommended**), add the image yourself and update the `templates/yukon.conf.template` file as well.
