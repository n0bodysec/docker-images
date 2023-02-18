# phpBB

This docker image contains a Plug-and-Play installation of the phpBB forum software, including a version-checking proxy for fail-safe work.

With this image, you can quickly deploy a ready-to-use forum without any effort.

## 🃏 Features

- Exclusive use of public images (therefore, always updated).
- Simple configuration through env vars.
- [Version-Checking](https://version.phpbb.com) Proxy.

## 🚀 Deploy

1. Create a `docker-compose.override.yml` file and edit it to suit your needs (***optional***).
2. Copy `.env.example` to `.env` and edit it accordingly.
3. Run `docker compose up -d`.

> If you want to use the version-checking proxy, please run `docker compose -f docker-compose.yml -f versioncheck.yml up -d` instead.

## 📜 Notes

- A proxy is being used for version checking because, for some reason, it fails using docker.
- Remember to check [Bitnami's Best Maintenance Practices](https://github.com/bitnami/containers/tree/main/bitnami/phpbb#maintenance) to update phpBB to the latest version.
