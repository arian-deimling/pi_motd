#!/usr/bin/bash

# arian
cpu=$(grep -m1 -E 'model name\s+:' /proc/cpuinfo | sed 's/model name[[:space:]]\+:[[:space:]]\+//g')


cpu=$(echo "$cpu" | sed 's/Processor //g')
cpun=$(grep -c '^processor' /proc/cpuinfo)

# TODO(AD) - maybe change to handle MHz caliber processors as well
cpu_ghz=$(awk '{print $1/1000000}' "/sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq")

echo $(echo "$cpu @ ${cpun}x ${cpu_ghz}GHz" | sed 's/^ *//g')
