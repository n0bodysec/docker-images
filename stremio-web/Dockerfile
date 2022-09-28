##########################################################################

# Builder image
FROM node:alpine AS builder

# Build args
ARG SERVER_VERSION=master
ARG DOWNLOAD_URL=https://dl.strem.io/four/${SERVER_VERSION}

WORKDIR /srv/stremio
RUN apk add --no-cache git
RUN git clone https://github.com/Stremio/stremio-web.git

WORKDIR /srv/stremio/stremio-web
RUN npm ci && npm run build

WORKDIR /srv/stremio/stremio-server
RUN wget $DOWNLOAD_URL/server.js $DOWNLOAD_URL/stremio.asar && cp server.js server.js.bak

##########################################################################

# Main image
FROM node:alpine

WORKDIR /srv/stremio
RUN apk add --no-cache ffmpeg
COPY --from=builder /srv/stremio/stremio-web/build ./web
COPY --from=builder /srv/stremio/stremio-server ./server
COPY patches.sh run.sh ./
RUN chmod +x ./patches.sh ./run.sh && \
	npm install -g http-server

# Expose default ports
EXPOSE 11470 8080

CMD ["./run.sh"]