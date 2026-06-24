#!/bin/bash

/usr/games/steamcmd +@sSteamCmdForcePlatformType linux +force_install_dir "/home/dragonwilds/data" +login anonymous +app_update 4019830 +quit || exit 1

cp /home/dragonwilds/server/DedicatedServer.ini.template /home/dragonwilds/data/RSDragonwilds/Saved/Config/LinuxServer/DedicatedServer.ini

chmod +x /home/dragonwilds/data/RSDragonwildsServer.sh

/home/dragonwilds/data/RSDragonwildsServer.sh -log -NewConsole -Port=7777
