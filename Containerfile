FROM fedora:39

RUN dnf install -y iproute
RUN dnf install -y qbittorrent-nox
RUN dnf install -y wireguard-tools

VOLUME /qbittorrent
VOLUME /downloads
VOLUME /wireguard

# Environment variables used by entrypoint.sh
ENV QBITTORRENT_UID=568
ENV QBITTORRENT_GID=568
ENV WIREGUARD_CONF=/wireguard/wg0.conf

# Environment variables used by qbittorrent-nox
ENV QBT_PROFILE=/qbittorrent

COPY ./entrypoint.sh /entrypoint.sh

CMD [ "/entrypoint.sh" ]
