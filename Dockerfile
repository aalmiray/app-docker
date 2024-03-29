# Generated with JReleaser 1.4.0-SNAPSHOT at 2022-11-15T16:09:52.087545+02:00
FROM azul/zulu-openjdk:19-jre

LABEL "org.opencontainers.image.title"="app"
LABEL "org.opencontainers.image.description"="Awesome App"
LABEL "org.opencontainers.image.url"="https://acme.com/app"
LABEL "org.opencontainers.image.licenses"="Apache-2.0"
LABEL "org.opencontainers.image.version"="1.0.0"
LABEL "org.opencontainers.image.revision"="03579715fc3f38f9f6f30d732ece0375f5c07db2"

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Zurich
RUN apt-get update && apt-get install -y unzip binutils

COPY assembly/ /

RUN unzip app-1.0.0.zip && \
    rm app-1.0.0.zip && \
    chmod +x app-1.0.0/bin/app


ENV PATH="${PATH}:/app-1.0.0/bin"

ENTRYPOINT ["/app-1.0.0/bin/app"]
