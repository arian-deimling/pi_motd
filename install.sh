#!/usr/bin/bash

if [ "$EUID" -ne 0 ]
then
    echo "This script must be run with root permissions."
    exit
fi

if [ ! -d /root ]
then
    echo "Cannot find root user home directory at \`/root'."
    exit
fi

if [ -d /usr/share/pi_motd ]
then
    mv /usr/share/pi_motd /tmp/pi_motd.bak
fi

# copy the scripts into the root users home directory
cp -r . /usr/share/pi_motd

ln -sf /usr/share/pi_motd/login.sh /etc/update-motd.d/50-login

