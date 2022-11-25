#!/usr/bin/bash

vcgencmd measure_temp | grep  -o -E --color=none '[[:digit:]].*'

