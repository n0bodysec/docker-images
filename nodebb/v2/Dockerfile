# Builder image
FROM node:alpine AS builder

ARG CHECKOUT=master

WORKDIR /app
RUN apk add --no-cache git dos2unix \
	&& chown -R node:node /app

USER node
RUN git clone https://github.com/NodeBB/NodeBB.git . \
	&& git checkout $CHECKOUT \
	&& cp install/package.json .
RUN npm install --only=prod

COPY --chown=node:node entrypoint.sh .
RUN chmod +x *.sh && dos2unix *.sh

# Main image
FROM node:alpine

ENV NODE_ENV=production \
	daemon=false \
	silent=false

WORKDIR /usr/src/app
RUN chown -R node:node /usr/src/app
USER node
COPY --from=builder /app .

ENTRYPOINT [ "/usr/src/app/entrypoint.sh" ]
CMD [ "node", "loader.js" ]
