##########################################################################

# Builder image
FROM alpine AS builder

WORKDIR /app
RUN apk add --no-cache dos2unix
COPY root/ .
RUN dos2unix *

##########################################################################

# Main image
FROM alpine

ENV TZ="UTC"

COPY --from=builder /app /
RUN apk add --no-cache bash s6-overlay shadow tzdata
RUN groupmod -g 1000 users && \
	useradd -u 911 -U -d /config -s /bin/ash abc && \
	usermod -G users abc && \
	mkdir -p /app /config /defaults && \
	sed -i -e 's/^root::/root:!:/' /etc/shadow && \
	rm -rf tmp/*

ENTRYPOINT [ "/init" ]
