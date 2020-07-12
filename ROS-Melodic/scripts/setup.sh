#!/bin/bash

SCRIPTDIR="$(cd $(dirname $0); pwd -P)"
CONFIGDIR="${SCRIPTDIR}/config"

# Set time zone
TZ=Europe/Moscow
ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Configure ubuntu repositories
cat ${CONFIGDIR}/sources.list > /etc/apt/sources.list

# Install common packages
apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y \
    tmux \
    mc \
    vim \
    openssh-client \
    htop \
    usbutils \
    wget \
    lsb-core \
    curl \
    gnupg2

# Setup configs
cat ${CONFIGDIR}/tmux.conf > .tmux.conf
cat ${CONFIGDIR}/bashrc > .bashrc

# Clear apt cashe
rm -rf /var/cache/apt
rm -rf /var/lib/apt/lists/*