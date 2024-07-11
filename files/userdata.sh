#!/bin/bash
apt-get update -y
apt-get upgrade -y
USERNAME=ansible
PASSWORD=ansible
adduser --disabled-password --gecos "" $USERNAME
echo "$USERNAME:$PASSWORD" | chpasswd
usermod -aG sudo $USERNAME
find /etc/ssh/sshd_config.d/ -type f -exec sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' {} +
service sshd reload
