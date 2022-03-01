FROM node:alpine

WORKDIR /stremio

# build args
ARG SERVER_VERSION=master
ARG FIX_CORS=1
ARG FIX_UNSUPPORTED_MEDIA=0

# env vars
ENV WEBPACK_MODE=development
ENV WEBPACK_PORT=8080
ENV EXTRA_ARGS="--allowed-hosts=all --no-https"
# server port only for reference. it's hardcoded on the server.js file
ENV SERVER_PORT=11470

# install required apps
RUN apk add --no-cache curl ffmpeg git

# download server and configure stremio-web
RUN git clone https://github.com/Stremio/stremio-web
RUN curl http://dl.strem.io/four/${SERVER_VERSION}/server.js --create-dirs -o server/server.js
RUN curl http://dl.strem.io/four/${SERVER_VERSION}/stremio.asar --create-dirs -o server/stremio.asar
RUN cd stremio-web && npm install

# copy and exec patches
COPY ./patches.sh ./patches.sh
RUN chmod +x patches.sh && FIX_CORS=${FIX_CORS} FIX_UNSUPPORTED_MEDIA=${FIX_UNSUPPORTED_MEDIA} ./patches.sh

# exposed ports (only for reference, see https://docs.docker.com/engine/reference/builder/#expose)
EXPOSE ${SERVER_PORT}/tcp ${WEBPACK_PORT}/tcp

# configure entrypoint file
RUN printf "#!/bin/sh\n\ncd stremio-web\nnpx webpack serve --mode=\$WEBPACK_MODE --port=\$WEBPACK_PORT \$EXTRA_ARGS &\ncd ..\nnode server/server.js\n" > entrypoint.sh
RUN chmod +x entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
