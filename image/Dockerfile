FROM cm2network/steamcmd:latest

LABEL maintainer="guilledipasquale@gmail.com"

ENV STEAMAPPID 896660
# Game files
ENV VALHEIM_SERVER_DIR "/home/steam/valheim-dedicated"
# World data is stored
ENV VALHEIM_DATA_DIR "/home/steam/valheim-data"
ENV VALHEIM_SERVER_NAME ""
ENV VALHEIM_WORLD_NAME ""
ENV VALHEIM_PASSWORD ""

# Ports needed by Valheim server
EXPOSE 2456/udp
EXPOSE 2457/udp
EXPOSE 2458/udp

RUN mkdir ${VALHEIM_SERVER_DIR} && ${VALHEIM_DATA_DIR}

# Install the Valheim server
RUN ./steamcmd.sh +login anonymous \
        +force_install_dir ${VALHEIM_SERVER_DIR} \
        +app_update ${STEAMAPPID} \
        validate +exit

# Store data outside of the container
VOLUME [ ${VALHEIM_SERVER_DIR}, ${VALHEIM_DATA_DIR} ]

USER steam:steam
WORKDIR $VALHEIM_SERVER_DIR
# start the server main script
ENTRYPOINT [ "./valheim_server.x86_64", "-name", "Dedicated", "-port", "2456" ]
CMD [ "-world", "${VALHEIM_WORLD_NAME}", "-password", "${VALHEIM_PASSWORD}", "-savedir", "${VALHEIM_SERVER_DIR}", "-public", "1" ]
