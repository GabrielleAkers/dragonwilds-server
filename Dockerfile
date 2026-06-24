FROM ubuntu:24.04

ARG UID
ARG GUID

USER root

RUN add-apt-repository multiverse && \
    dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y steamcmd

RUN groupadd -g ${GUID} -o dragonwilds
RUN useradd -m -u ${UID} -g ${GUID} -o -s /bin/bash dragonwilds

RUN chown -hR dragonwilds:dragonwilds /home/dragonwilds/data

RUN steamcmd +force_install_dir /home/dragonwilds/data +login anonymous +app_update 4019830 +quit

COPY --chown=dragonwilds DedicatedServer.ini.template /home/dragonwilds/data/RSDragonwilds/Saved/Config/LinuxServer/DedicatedServer.ini
COPY --chown=dragonwilds entrypoint.sh /home/dragonwilds/entrypoint.sh

RUN chmod +x /home/dragonwilds/entrypoint.sh

USER dragonwilds

WORKDIR /home/dragonwilds

ENTRYPOINT ["./entrypoint.sh"]