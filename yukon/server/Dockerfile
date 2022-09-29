FROM node:alpine

# args & env
ARG WAIT_FOR_VERSION=4df3f9262d84cab0039c07bf861045fbb3c20ab7
ENV DOCKERIZE_VERSION=v0.6.1

# install dockerize
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
	&& tar -C /usr/local/bin -xzvf dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
	&& rm dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz

WORKDIR /srv/server
CMD ["npm", "run", "start"]
