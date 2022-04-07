FROM golang:1.14-alpine

# env vars
ENV WORK_DIR="/srv/go-sync"

# exposed ports
EXPOSE 8295/tcp

# install required apps
RUN apk add --no-cache --update ca-certificates git make aws-cli

# run
WORKDIR $WORK_DIR
CMD ["make", "build"]
