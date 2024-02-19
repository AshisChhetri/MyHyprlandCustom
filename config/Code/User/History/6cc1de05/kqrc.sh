#!/bin/bash

echo "Enter Node Version:\n"
read $V
VERSION="v$V"
DISTRO=linux-x64
sudo mkdir -p /usr/local/lib/nodejs
sudo tar -xJvf node-$VERSION-$DISTRO.tar.xz -C /usr/local/lib/nodejs 
