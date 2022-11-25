#/usr/bin/bash

date +"%A, %B %_d, %Y %r" | sed 's/am/AM/g' | sed 's/pm/PM/g'
