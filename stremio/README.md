# stremio

<img align="right" src="https://avatars.githubusercontent.com/u/13152917?s=256">

Stremio is a modern multimedia center that is an all-in-one solution for your video entertainment. With this Docker image, you can launch a container ready to use with Stremio Web, Stremio Shell and Stremio Server.

### ❓ What is included in this image?
- A build copy of the open source [stremio-web](https://github.com/Stremio/stremio-web/).
- A local copy of the closed source [stremio-shell](https://github.com/Stremio/stremio-shell)'s [web ui](https://app.strem.io/).
- A local copy of the closed source [stremio-server](http://dl.strem.io/four/master/server.js).

> ⚠️ **WARNING**: Stremio released an official server docker image [here](https://github.com/Stremio/server-docker). You can continue to use this version instead, as it supports hot patching and integrates both web ui's into a single image.

## 🃏 Features

- Small final image, thanks to multi-stage builds.
- Optional web ui patches for better usability.
- Optional server patches, customizable through custom scripts and environment variables.

## 🚀 Deploy

You can deploy in two different ways:

**1. Docker Compose (RECOMMENDED)**
```console
docker compose up -d
```

**2. Docker CLI**
```console
docker run --rm -p 8080:8080 -p 8081:8081 -p 11470:11470 -e APPLY_PATCHES=1 -e FIX_UNSUPPORTED_MEDIA=1 -e NO_CORS=1 -v ${PWD}:/root/.stremio-server n0bodysec/stremio
```

## ⚙️ Configuration

### Best practices

Enabling the `APPLY_PATCHES`, `FIX_UNSUPPORTED_MEDIA` and `NO_CORS` environment variables is the preferred way to go.
> ⚠️ If your intention is to use only the **old ui web**, then you do not need to apply any patches, therefore, you do not require any of the above environment variables.

### Apply custom patches

To apply the optional patches for the server, you must set the `APPLY_PATCHES` environment variable to `1`.  
All files with `.sh` extension inside the `files/patches` folder will be loaded when that environment variable is active. You can add your own patches to that folder.
> ⚠️ **WARNING**: As the container runs in a linux environment, it is mandatory that the patch files have `LF` ending instead of `CRLF`.

### Environment variables

| **Variable**              | **Description**                         | **Source**     |
|-----------------------    |-------------------------------------    |------------    |
| APPLY_PATCHES             | Apply patches defined in patches.sh     | run.sh         |
| FIX_UNSUPPORTED_MEDIA     | Fix for HTTP 415                        | patches/       |
| NO_CORS                   | Do no check CORS in the SERVER          | server.js      |
| WEBUI_LOCATION            | Web UI location (direct access)         | server.js      |

For more environment variables, please check the `server.js` file.  
Undocumented env vars: `APPDATA`, `APP_PATH`, `BLUEBIRD_DEBUG`, `BLUEBIRD_LONG_STACK_TRACES`, `BLUEBIRD_WARNINGS`, `BLUEBIRD_W_FORGOTTEN_RETURN`, `CASTING_DISABLED`, `COLORTERM`, `DEBUG`, `DEBUG_COLORS`, `DEBUG_COLORS`, `DEBUG_DEPTH`, `DEBUG_FD`, `DEBUG_MIME`, `DEBUG_SHOW_HIDDEN`, `DISABLE_CACHING`, `DISABLE_CACHING`, `FFMPEG_BIN`, `FFMPEG_DEBUG`, `FFSPLIT_DEBUG`, `FORCE_COLOR`, `HOME`, `HTTPS_CERT_ENDPOINT`, `NODE_DEBUG`, `NODE_ENV`, `NO_DEPRECATION`, `OPEN`, `OSTYPE`, `PATHEXT`, `PORT`, `READABLE_STREAM`, `SUDO_USER`, `SystemRoot`, `TEMP`, `TERM`, `TMP`, `TMPDIR`, `TRACE_DEPRECATION`, `TV_ENV`, `YTDL_NO_UPDATE`, `npm_config_arch`, `npm_config_platform`, 
`windir`