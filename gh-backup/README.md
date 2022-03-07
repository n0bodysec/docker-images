# gh-backup

Automatic github backups using Docker & Python.

## Table of contents

- [🚀 Deploy](#-deploy)
- [👍 Acknowledgements](#-acknowledgements)
- [📜 Notice](#-notice)
- [📖 Example Script](#-example-script)

## 🚀 Deploy

1. Edit the `docker-compose.yaml` file to suit your needs (e.g. gh token).
2. Copy `.env.example` to `.env` and edit it accordingly.
3. Add your desired scripts to the `scripts` folder (create one if it does not exist).
4. Run `docker-compose up -d`.

## 👍 Acknowledgements

- [Jose Diaz-Gonzalez](https://github.com/josegonzalez) - For his [github-backup](https://github.com/josegonzalez/python-github-backup) script.

## 📜 Notice

- Only valid scripts in `scripts` folder will be executed (scripts MUST start with a [shebang](<https://en.wikipedia.org/wiki/Shebang_(Unix)>)).
- Scripts' filename must match the following regex: `(^[a-zA-Z0-9_.-]+$)`.
- Remember to add an `--output-directory` that matches a Docker volume (e.g `/srv/github-backup/data/`).

## 📖 Example Script

```sh
#!/bin/sh

TIMESTAMP=$(date +%s)
USERNAME=n0bodysec
MAX_BACKUPS=2

# exit immediately if a command exits with a non-zero status.
# set -e

# backup repositories
github-backup $USERNAME --token=$GH_TOKEN --all --bare --fork --output-directory=$WORK_DIR/data/$USERNAME/$TIMESTAMP

# delete empty folders
find $WORK_DIR/data/$USERNAME/ -type d -empty -maxdepth 1 | xargs rm -rf

# delete old backups
ls -d1 $WORK_DIR/data/$USERNAME/* | head -n -${MAX_BACKUPS} | xargs rm -rf

# token censorship
grep -RiIl $WORK_DIR/data/$USERNAME/ -e $GH_TOKEN | xargs sed -i "s/$GH_TOKEN/censored/g"
```
