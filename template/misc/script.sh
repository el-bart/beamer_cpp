#!/bin/bash
set -eu -o pipefail
env
date
uptime
echo "$PATH" | tr ':' '\n'
