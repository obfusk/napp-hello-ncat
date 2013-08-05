#!/bin/bash
set -e
p="${1:-${PORT:-8888}}"
while true; do ncat -l "$p" -e ./server.bash; done
