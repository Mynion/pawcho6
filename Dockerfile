# syntax=docker/dockerfile:1.4

FROM alpine AS builder

RUN apk add --no-cache git openssh-client

WORKDIR /app

RUN --mount=type=ssh git clone git@github.com:TWÓJ_LOGIN/pawcho6.git .

ARG VERSION=1.0

RUN echo "<html><body>" > index.html && \
    echo "<h1>Informacje o serwerze</h1>" >> index.html && \
    echo "<p>IP serwera: $(hostname -i)</p>" >> index.html && \
    echo "<p>Hostname: $(hostname)</p>" >> index.html && \
    echo "<p>Wersja aplikacji: ${VERSION}</p>" >> index.html && \
    echo "</body></html>" >> index.html

FROM nginx:alpine

COPY --from=builder /app/index.html /usr/share/nginx/html/index.html

HEALTHCHECK CMD wget --quiet --tries=1 --spider http://localhost || exit 1

EXPOSE 80