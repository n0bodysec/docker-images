FROM alpine:edge

EXPOSE 9050/tcp 8853/udp

RUN apk add --no-cache tor

USER tor
CMD ["/usr/bin/tor", "-f", "/etc/tor/torrc"]