#!/usr/bin/bash

totaldisk=$(df -h -x aufs -x tmpfs -x overlay --total 2>/dev/null | tail -1)
disktotal=$(awk '{print $2}' <<< "${totaldisk}")
diskused=$(awk '{print $3}' <<< "${totaldisk}")
diskusedper=$(awk '{print $5}' <<< "${totaldisk}")
diskusage="${diskused} / ${disktotal} (${diskusedper})"

echo $diskusage
