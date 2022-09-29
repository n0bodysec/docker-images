FROM node:alpine

# args & env
ARG WAIT_FOR_VERSION=4df3f9262d84cab0039c07bf861045fbb3c20ab7
ARG PUID=1000
ARG PGID=1000
ENV DOCKERIZE_VERSION=v0.6.1

# setup non-root user
RUN deluser --remove-home node && addgroup -S node -g ${PGID} && adduser -S -G node -u ${PUID} node

# install dockerize
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
	&& tar -C /usr/local/bin -xzvf dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
	&& rm dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz

# run as non-root user
USER node

WORKDIR /srv/server
CMD ["npm", "run", "start"]
