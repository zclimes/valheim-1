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

COPY --chown=steam:steam entrypoint.sh /
RUN mkdir ${VALHEIM_SERVER_DIR} && chown -R steam:steam ${VALHEIM_SERVER_DIR}
RUN mkdir ${VALHEIM_DATA_DIR} && chown -R steam:steam ${VALHEIM_DATA_DIR}

# Install the Valheim server
RUN ./steamcmd.sh +login anonymous \
        +force_install_dir ${VALHEIM_SERVER_DIR} \
        +app_update ${STEAMAPPID} \
        validate +exit

USER steam:steam
# Store data outside of the container
VOLUME ${VALHEIM_DATA_DIR}

# start the server main script
ENTRYPOINT [ "/entrypoint.sh" ]

# Currently Valheim only supports SIGINT for graceful termination.
# https://valheimbugs.featureupvote.com/suggestions/159711/dedicated-server-does-not-save-world-on-sigterm
STOPSIGNAL SIGINT