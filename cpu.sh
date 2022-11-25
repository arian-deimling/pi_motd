#!/usr/bin/bash

cpu=$(awk -F':' '/^model name/ {split($2, A, " @"); print A[1]; exit}' /proc/cpuinfo)
cpu=$(echo "$cpu" | sed 's/Processor //g')
cpun=$(grep -c '^processor' /proc/cpuinfo)

# TODO(AD) - maybe change to handle MHz caliber processors as well
cpu_ghz=$(awk '{print $1/1000000}' "/sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq")

echo $(echo "$cpu @ ${cpun}x ${cpu_ghz}GHz" | sed 's/^ *//g')
