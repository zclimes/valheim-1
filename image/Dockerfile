FROM cm2network/steamcmd:latest

LABEL maintainer="guilledipasquale@gmail.com"

ENV STEAMAPPID 896660
# Game files
ENV VALHEIM_SERVER_DIR "/home/steam/valheim-dedicated"
# Where world data is stored
ENV VALHEIM_DATA_DIR "/home/steam/valheim-data"
ENV VALHEIM_SERVER_NAME ""
ENV VALHEIM_WORLD_NAME ""
ENV VALHEIM_PASSWORD ""

# Ports needed by Valheim server
EXPOSE 2456/udp
EXPOSE 2457/udp
EXPOSE 2458/udp

# install the Valheim server
RUN ./steamcmd.sh +login anonymous \
        +force_install_dir ${VALHEIM_SERVER_DIR} \
        +app_update ${STEAMAPPID} \
        validate +exit

USER 1000:1000

WORKDIR $VALHEIM_SERVER_DIR
# start the server main script
ENTRYPOINT [ "./valheim_server.x86_64", "Dedicated", "-port", "2456" ]
CMD [ "" ]
