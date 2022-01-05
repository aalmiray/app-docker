# Generated with JReleaser 0.10.0 at 2022-01-05T16:44:36.75433+01:00
FROM azul/zulu-openjdk-alpine:8-jre

LABEL "org.opencontainers.image.title"="app"
LABEL "org.opencontainers.image.description"="Sample application"
LABEL "org.opencontainers.image.url"="https://acme.com/wesome-app"
LABEL "org.opencontainers.image.licenses"="Apache-2.0"
LABEL "org.opencontainers.image.version"="1.0.0"
LABEL "org.opencontainers.image.revision"="4df324cdd4ce8845bdcea07c32d478593627d42d"


COPY assembly/ /

RUN unzip app-1.0.0.zip && \
    rm app-1.0.0.zip && \
    chmod +x app-1.0.0/bin/app


ENV PATH="${PATH}:/app-1.0.0/bin"

ENTRYPOINT ["/app-1.0.0/bin/app"]
