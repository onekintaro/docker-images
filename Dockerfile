# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: Source Engine
# Minimum Panel Version: 0.6.0
# ----------------------------------
FROM        debian:stretch

MAINTAINER  Onekintaro, <info@swisscrafting.ch>
ENV         DEBIAN_FRONTEND noninteractive
# Install Dependencies
COPY        ./xvfb.service /etc/systemd/system/xvfb.service
RUN         dpkg --add-architecture i386 \
            && apt update \
            && apt upgrade -y \
            && apt install -y mono-complete mono-devel install -y tar git wget unzip curl gcc g++ xz-utils libgdiplus lib32gcc1 lib32tinfo5 lib32z1 lib32stdc++6 libtinfo5:i386 libncurses5:i386 libcurl3-gnutls:i386 iproute2 gdb xorg xvfb xfonts-100dpi xfonts-75dpi xfonts-scalable xfonts-cyrillic \
            && useradd -m -d /home/container container
            && systemctl enable xvfb.service

USER        container
ENV         HOME /home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/bash", "/entrypoint.sh"]
