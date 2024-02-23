#!/bin/sh

set -e

wg-quick up "$WIREGUARD_CONF"

groupadd --system --gid $QBITTORRENT_GID qbittorrent
useradd  --system --gid $QBITTORRENT_GID --uid $QBITTORRENT_UID qbittorrent

sudo -E -u qbittorrent /usr/bin/qbittorrent-nox
# --profile is passed through $QBT_PROFILE
