# args
ARG WAIT_FOR_VERSION=d48601a8a90c3d22fade68d09b4240739fb44a46

# production
FROM node:alpine AS production

ARG WAIT_FOR_VERSION
ARG BRANCH

RUN apk add --no-cache --update git python3 py-pip make build-base cairo-dev pango-dev jpeg-dev giflib-dev librsvg-dev
RUN wget -O /usr/local/bin/wait-for https://raw.githubusercontent.com/eficode/wait-for/${WAIT_FOR_VERSION}/wait-for && chmod +x /usr/local/bin/wait-for

USER node
WORKDIR /app

RUN git clone https://github.com/fosscord/fosscord-server.git src \
	&& cd src \
	&& git checkout ${BRANCH} \
	&& npm ci && npm i erlpack pg mysql sqlite3 bcrypt canvas \
	&& npm run setup

CMD ["npm", "--prefix", "src", "run", "start"]


# development
FROM node:alpine AS development

ARG WAIT_FOR_VERSION

RUN apk add --no-cache --update git python3 py-pip make build-base cairo-dev pango-dev jpeg-dev giflib-dev librsvg-dev
RUN wget -O /usr/local/bin/wait-for https://raw.githubusercontent.com/eficode/wait-for/${WAIT_FOR_VERSION}/wait-for && chmod +x /usr/local/bin/wait-for

USER node
WORKDIR /app

CMD ["npm", "--prefix", "src", "run", "start"]
