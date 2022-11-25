#!/usr/bin/bash

shell_type=$(echo "$SHELL" | awk -F'/' '{print $NF}')
shell_version=$(bash --version | sed 's/^.*version //g' | sed 's/(.*$//g' | head -1)

echo "$shell_type $shell_version"

