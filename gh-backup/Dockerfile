FROM alpine:latest

# build args & env variables
ENV WORK_DIR="/srv/github-backup"
ENV GH_TOKEN=unknown
ARG CRON_LINE="0       0       *       *       *       run-parts-x $WORK_DIR/scripts"

# workdir
WORKDIR $WORK_DIR

# install necessary dependencies
RUN apk add --update --no-cache run-parts git python3 py-pip tzdata

# install github-backup
RUN pip3 install github-backup

# add crontab
RUN (crontab -l 2>/dev/null | sed '/^$/d'; printf "$CRON_LINE\n\n") | crontab -

# hack for run-parts
RUN printf '#!/bin/sh\n\nchmod +x -R $1\nrun-parts --regex="(^[a-zA-Z0-9_.-]+$)" $1\n' > /usr/local/bin/run-parts-x
RUN chmod +x /usr/local/bin/run-parts-x

# configure entrypoint file
RUN printf "#!/bin/sh\n\ncrond -f -l 0\n" > entrypoint.sh
RUN chmod +x entrypoint.sh

# entrypoint
ENTRYPOINT ["./entrypoint.sh"]
