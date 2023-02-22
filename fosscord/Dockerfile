FROM node:alpine

# args & env
ARG WAIT_FOR_VERSION=d48601a8a90c3d22fade68d09b4240739fb44a46
ARG PUID=1000
ARG PGID=1000
ENV WORK_DIR=/srv/fosscord-server

# setup non-root user
RUN deluser --remove-home node \
	&& addgroup -S node -g ${PGID} \
	&& adduser -S -G node -u ${PUID} node

# install required apps
RUN apk add --no-cache --update git python3 py-pip make build-base cairo-dev pango-dev jpeg-dev giflib-dev librsvg-dev

# download wait-for
RUN wget -O /usr/local/bin/wait-for https://raw.githubusercontent.com/eficode/wait-for/${WAIT_FOR_VERSION}/wait-for \
	&& chmod +x /usr/local/bin/wait-for

# run as non-root user
USER node
RUN git config --global --add safe.directory ${WORK_DIR}/src

WORKDIR $WORK_DIR/
CMD ["npm", "--prefix", "src", "run", "start"]
