FROM cm2network/steamcmd

# where the Valheim server is installed to
ENV CRAFTOPIA_SERVER_DIR "/home/steam/craftopia-server"

# install the Valheim server
RUN ./steamcmd.sh +login anonymous \
+force_install_dir $CRAFTOPIA_SERVER_DIR \
+app_update 1670340 \
validate +exit

# the server needs these 3 ports exposed by default
EXPOSE 4380/udp
EXPOSE 27000-27031/udp
EXPOSE 27036/udp
EXPOSE 6587/tcp
EXPOSE 27015-27030/tcp
EXPOSE 27036-27037/tcp


# copy over the modified server start script
WORKDIR ${VALHEIM_SERVER_DIR}

ENTRYPOINT ['/bin/bash']