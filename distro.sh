#!/usr/bin/bash

distro_release=$(awk -F'=' '/^PRETTY_NAME=/ {print $2}' /etc/os-release)

echo "$(echo $distro_release | sed -e 's/^"//' -e 's/"$//')"
