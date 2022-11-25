#!/usr/bin/bash

total_mem=$(awk '/MemTotal/ { print $2 }' /proc/meminfo)
totalmem=$((total_mem / 1024))
free_mem=$(awk '/MemFree/ { print $2 }' /proc/meminfo)
used_mem=$((total_mem - free_mem))
usedmem=$((used_mem / 1024))
mem="${usedmem}MiB / ${totalmem}MiB"
echo $mem
