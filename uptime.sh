#!/usr/bin/bash

uptime=$(</proc/uptime)
uptime=${uptime//.*}

mins=$((uptime/60%60))
hours=$((uptime/3600%24))
days=$((uptime/86400))
uptime="${mins}m"
if [ "${hours}" -ne "0" ]; then
    uptime="${hours}h ${uptime}"
fi
if [ "${days}" -ne "0" ]; then
    uptime="${days}d ${uptime}"
fi

echo $uptime
