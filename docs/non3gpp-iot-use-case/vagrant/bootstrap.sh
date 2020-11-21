#!/bin/bash

function log {
	echo -e "[INFO] $1"
}

function logerr {
	echo -e "[ERRO] $1"
}

SBRT_COMPOSE_REPO='https://github.com/LABORA-INF-UFG/SBrT2020-Minicurso1.git'
DOCKER_COMPOSE_VERSION='1.25.5'
VAGRANT_UID='1000'
SYNCED_FOLDER='/vagrant'
WORKSPACE='sbrt-compose'

log "Start pre-config script"

log "Set environment variables"
export DEBIAN_FRONTEND=noninteractive

log "Install dependencies"
apt-get update -qq \
	&& apt-get install -qq \
		git \
		build-essential \
		vim \
		strace \
		net-tools \
		iputils-ping \
		iproute2

log "Update kernel version: 5.0.0-23-generic"
apt-get install -qq \
		linux-image-5.0.0-23-generic \
		linux-modules-5.0.0-23-generic \
		linux-headers-5.0.0-23-generic \
	&& grub-set-default 1 \
	&& update-grub
