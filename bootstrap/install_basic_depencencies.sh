#!/bin/bash

apt update && apt install -y wget tar curl

echo "installing task"
curl --location -o install-task.sh https://taskfile.dev/install.sh
chmod +x install-task.sh
./install-task.sh -d -b /usr/local/bin
rm install-task.sh

echo "Installing kubeval..."
cd /tmp/
wget https://github.com/instrumenta/kubeval/releases/latest/download/kubeval-linux-amd64.tar.gz
tar xf kubeval-linux-amd64.tar.gz
mv kubeval /usr/local/bin
chmod +x /usr/local/bin/kubeval