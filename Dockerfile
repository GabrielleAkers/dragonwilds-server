FROM ubuntu:24.04

ARG UID
ARG GUID

USER root

RUN apt-get update && \
    apt-get install -y software-properties-common

# needed to accept steam EULA
ENV DEBIAN_FRONTEND=noninteractive
RUN echo steam steam/question select "I AGREE" | debconf-set-selections && \
    echo steam steam/license note '' | debconf-set-selections

RUN add-apt-repository multiverse && \
    dpkg --add-architecture i386
RUN apt-get update && \
    apt-get install -y steamcmd

RUN groupadd -g ${GUID} -o dragonwilds
RUN useradd -m -u ${UID} -g ${GUID} -o -s /bin/bash dragonwilds

RUN mkdir -p /home/dragonwilds/data && \
    chown -hR dragonwilds:dragonwilds /home/dragonwilds/

USER dragonwilds

COPY --chown=dragonwilds DedicatedServer.ini.template /home/dragonwilds/server/
COPY --chown=dragonwilds entrypoint.sh /home/dragonwilds/server/

RUN chmod +x /home/dragonwilds/server/entrypoint.sh

WORKDIR /home/dragonwilds/server

ENTRYPOINT ["/home/dragonwilds/server/entrypoint.sh"]
