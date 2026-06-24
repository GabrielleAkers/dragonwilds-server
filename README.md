# dragonwilds-server

containerized (Docker) Runescape Dragonwilds dedicated server

# how to use

1. clone this repo, make a directory data in it, you may need to run `chmod 0777 data` to make steamcmd work idk why
2. install docker, give that user permissions to use docker
3. change the UID and GUID in compose.yaml to the uid and gid that match your user (found with `id`)
4. (optional) change the ports in [compose.yaml](./compose.yaml) and [entrypoint.sh](./entrypoint.sh) from 7777 to your preferred
5. fill in the templated values in [DedicatedServer.ini.template](./DedicatedServer.ini.template)
6. `compose compose build --progress plain --no-cache && docker compose up -d` to start
7. `docker attach` to attach to the container, CTRL+P->CTRL+Q to detach