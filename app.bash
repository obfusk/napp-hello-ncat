#!/bin/bash
set -e
p="${1:-${PORT:-8888}}" pid=
cleanup () {
  set +e
  echo "bye (pid=$pid)"
  [ -z "$pid" ] || kill "$pid"
}
trap cleanup EXIT
echo "Listening on $p"
while true; do
  ncat -l "$p" -e ./server.bash & pid=$!
  set +e; wait "$pid"; ok=$? pid=; set -e
  [ "$ok" == 0 ]
done
