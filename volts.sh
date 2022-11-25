#!/usr/bin/bash

vcgencmd measure_volts | grep  -o -E --color=none '[[:digit:]].*'
