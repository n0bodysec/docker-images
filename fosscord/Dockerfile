FROM node:alpine

# args & env
ENV WORK_DIR=/srv/fosscord-server

# install required apps
RUN apk add --no-cache --update git python3 py-pip make build-base cairo-dev pango-dev jpeg-dev giflib-dev librsvg-dev
RUN ln -s /usr/bin/python3 /usr/bin/python
RUN ln -s /bin/grep /usr/bin/grep

# Run as non-root user
USER node
RUN git config --global --add safe.directory ${WORK_DIR}/src

EXPOSE 3001 3002 3003

WORKDIR $WORK_DIR/
CMD ["npm", "--prefix", "src", "run", "start:bundle"]