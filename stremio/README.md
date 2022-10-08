# stremio-web

This docker image contains a built copy of the open source [stremio-web](https://github.com/Stremio/stremio-web/), a copy of the stremio-shell web ui and a copy of the closed source [stremio-server](http://dl.strem.io/four/master/server.js).

With this image, you can quickly deploy a ready-to-use stremio-web client and server.

## 🃏 Features

- Small final image (thanks to multi-stage builds).
- Fully customizable through environment variables and bind mounts.
- Optional patches for better usability (via script).
- Both Stremio Web & old Web UI (Stremio Shell) included.

## 🚀 Deploy

1. Create a `docker-compose.override.yml` file and edit it to suit your needs (***optional***).
2. Copy `.env.example` to `.env` and edit it accordingly.
3. Run `docker compose up -d`.

## ⚙️ Configuration

## Best practice

Running the container with docker compose, with `APPLY_PATCHES`, `FIX_UNSUPPORTED_MEDIA` and `NO_CORS` env vars is the preferred way to go.
> If you want to use the old webui, then you don't need to apply any patches.

Example (without compose)
```console
docker run --rm -p 8080:8080 -p 8081:8081 -p 11470:11470 -e APPLY_PATCHES=1 -e FIX_UNSUPPORTED_MEDIA=1 -e NO_CORS=1 -v ${PWD}:/root/.stremio-server n0bodysec/stremio
```

## Docker Compose

Using docker compose is the preferred way to go.
```shell
docker compose up -d
```

## Apply custom patches

To apply the optional patches (see `patches.sh`) you **must** set the environment variable `APPLY_PATCHES`.
```shell
docker run -e APPLY_PATCHES=1 n0bodysec/stremio
```

## Environment variables

| **Variable**          	| **Description**                     	| **Source** 	|
|-----------------------	|-------------------------------------	|------------	|
| APPLY_PATCHES         	| Apply patches defined in patches.sh 	| run.sh     	|
| FIX_UNSUPPORTED_MEDIA 	| Fix for HTTP 415                    	| patches.sh 	|
| FIX_CORS              	| **Deprecated.** See NO_CORS         	| patches.sh 	|
| NO_CORS               	| Do no check CORS in the SERVER      	| server.js  	|
| WEBUI_LOCATION            | Web UI location (direct access)       | server.js     |

For more environment variables, please check the `server.js` file.  
Undocumented env vars: `APPDATA`, `APP_PATH`, `BLUEBIRD_DEBUG`, `BLUEBIRD_LONG_STACK_TRACES`, `BLUEBIRD_WARNINGS`, `BLUEBIRD_W_FORGOTTEN_RETURN`, `CASTING_DISABLED`, `COLORTERM`, `DEBUG`, `DEBUG_COLORS`, `DEBUG_COLORS`, `DEBUG_DEPTH`, `DEBUG_FD`, `DEBUG_MIME`, `DEBUG_SHOW_HIDDEN`, `DISABLE_CACHING`, `DISABLE_CACHING`, `FFMPEG_BIN`, `FFMPEG_DEBUG`, `FFSPLIT_DEBUG`, `FORCE_COLOR`, `HOME`, `HTTPS_CERT_ENDPOINT`, `NODE_DEBUG`, `NODE_ENV`, `NO_DEPRECATION`, `OPEN`, `OSTYPE`, `PATHEXT`, `PORT`, `READABLE_STREAM`, `SUDO_USER`, `SystemRoot`, `TEMP`, `TERM`, `TMP`, `TMPDIR`, `TRACE_DEPRECATION`, `TV_ENV`, `YTDL_NO_UPDATE`, `npm_config_arch`, `npm_config_platform`, 
`windir`