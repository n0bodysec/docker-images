FROM node:alpine

WORKDIR /stremio

# args and env vars
ARG SERVER_VERSION=master
ENV WEBPACK_MODE=development
ENV WEBPACK_PORT=8080
ENV EXTRA_ARGS="--allowed-hosts=all"
# server port only for reference. it's hardcoded on the server.js file
ENV SERVER_PORT=11470

# install required apps
RUN apk add --no-cache curl ffmpeg git

# download server and configure stremio-web
RUN git clone https://github.com/Stremio/stremio-web
RUN curl http://dl.strem.io/four/${SERVER_VERSION}/server.js --create-dirs -o server/server.js
RUN curl http://dl.strem.io/four/${SERVER_VERSION}/stremio.asar --create-dirs -o server/stremio.asar
RUN cd stremio-web && npm install

# fix server cors
RUN sed -i 's/if (ok) enginefs.sendCORSHeaders/if (true) enginefs.sendCORSHeaders/' server/server.js

# exposed ports (only for reference, see https://docs.docker.com/engine/reference/builder/#expose)
EXPOSE ${SERVER_PORT}/tcp ${WEBPACK_PORT}/tcp

# configure entrypoint file
RUN printf "#!/bin/sh\n\ncd stremio-web\nnpx webpack serve --mode=\$WEBPACK_MODE --port=\$WEBPACK_PORT \$EXTRA_ARGS &\ncd ..\nnode server/server.js\n" > entrypoint.sh
RUN chmod +x entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
