##########################################################################

# Builder image
FROM node:alpine AS builder

# Build args
ARG SERVER_VERSION=master
ARG DOWNLOAD_URL=https://dl.strem.io/four/${SERVER_VERSION}

WORKDIR /srv/stremio
RUN apk add --no-cache git wget dos2unix
RUN git clone https://github.com/Stremio/stremio-web.git

WORKDIR /srv/stremio/scripts
COPY patches.sh run.sh ./
RUN dos2unix *.sh

WORKDIR /srv/stremio/stremio-shell
RUN wget -mkEpnp -nH https://staging.strem.io || true

WORKDIR /srv/stremio/stremio-web
RUN npm ci && npm run build

WORKDIR /srv/stremio/stremio-server
RUN wget $DOWNLOAD_URL/server.js $DOWNLOAD_URL/stremio.asar && cp server.js server.js.bak

##########################################################################

# Main image
FROM node:alpine

WORKDIR /srv/stremio
RUN apk add --no-cache ffmpeg
COPY --from=builder /srv/stremio/stremio-shell ./shell
COPY --from=builder /srv/stremio/stremio-web/build ./web
COPY --from=builder /srv/stremio/stremio-server ./server
COPY --from=builder /srv/stremio/scripts ./
RUN chmod +x ./patches.sh ./run.sh && \
	npm install -g http-server

# Expose default ports
EXPOSE 11470 8080 8081

CMD ["./run.sh"]