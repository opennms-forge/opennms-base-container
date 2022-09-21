#!/bin/sh

set -e

apt-get update
apt-get -y --no-install-recommends install "$@"
apt-get -y autoclean
apt-get -y clean
rm -rf /var/cache/apt
rm -rf /var/lib/apt/laists/*
