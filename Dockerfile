# Generated with JReleaser 1.0.0 at 2022-05-25T17:24:05.264-07:00
FROM ubuntu:latest

LABEL "org.opencontainers.image.title"="app"
LABEL "org.opencontainers.image.description"="Sample application"
LABEL "org.opencontainers.image.url"="https://acme.com/awesome-app"
LABEL "org.opencontainers.image.licenses"="Apache-2.0"
LABEL "org.opencontainers.image.version"="1.0.0"
LABEL "org.opencontainers.image.revision"="4df324cdd4ce8845bdcea07c32d478593627d42d"

RUN apt-get update -y
RUN apt-get install unzip

COPY assembly/ /

RUN unzip app-1.0.0.zip && \
    rm app-1.0.0.zip && \
    chmod +x app-1.0.0/bin/app


ENV PATH="${PATH}:/app-1.0.0/bin"

ENTRYPOINT ["/app-1.0.0/bin/app"]
