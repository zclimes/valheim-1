#!/bin/bash -e

export LD_LIBRARY_PATH=$VALHEIM_SERVER_DIR/linux64:$LD_LIBRARY_PATH
export SteamAppId=892970

echo "Valheim server name is: ${VALHEIM_SERVER_NAME}"
echo "Valheim world name is: ${VALHEIM_WORLD_NAME}"

/$VALHEIM_SERVER_DIR/valheim_server.x86_64 \
    -nographics \
    -batchmode \
    -name $VALHEIM_SERVER_NAME \
    -port 2456 \
    -world $VALHEIM_WORLD_NAME \
    -password $VALHEIM_PASSWORD \
    -savedir $VALHEIM_DATA_DIR \
    -public 1
