# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: Source Engine
# Minimum Panel Version: 0.6.0
# ----------------------------------
FROM        microsoft/dotnet:2.1.0-runtime

MAINTAINER  Onekintaro, <info@swisscrafting.ch>
ENV         DEBIAN_FRONTEND noninteractive
# Install Dependencies
RUN         useradd -m -d /home/container container

USER        container
ENV         HOME /home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/bash", "/entrypoint.sh"]
