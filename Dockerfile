# [JRELEASER_VERSION]
FROM azul/zulu-openjdk-alpine:8-jre

LABEL "org.opencontainers.image.title"="app"
LABEL "org.opencontainers.image.description"="Awesome App"
LABEL "org.opencontainers.image.url"="https://acme.com/app"
LABEL "org.opencontainers.image.licenses"="Apache-2.0"
LABEL "org.opencontainers.image.version"="1.0.0"
LABEL "org.opencontainers.image.revision"="03579715fc3f38f9f6f30d732ece0375f5c07db2"


COPY assembly/ /

RUN unzip app-1.0.0.zip && \
    rm app-1.0.0.zip && \
    chmod +x app-1.0.0/bin/app


ENV PATH="${PATH}:/app-1.0.0/bin"

ENTRYPOINT ["/app-1.0.0/bin/app"]
