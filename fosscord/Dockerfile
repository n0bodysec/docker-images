FROM node:alpine

# args & env
ENV WORK_DIR=/srv/fosscord-server
ARG HTTP_PORT=3001
ARG WS_PORT=3002
ARG CDN_PORT=3003

# install required apps
RUN apk add --no-cache --update git python3 py-pip make build-base
RUN ln -s /usr/bin/python3 /usr/bin/python

# Run as non-root user
USER node
RUN git config --global --add safe.directory ${WORK_DIR}/src

EXPOSE ${HTTP_PORT} ${WS_PORT} ${CDN_PORT}

WORKDIR $WORK_DIR/
CMD ["npm", "--prefix", "src", "run", "start:bundle"]