#!/bin/bash
set -e
while read -r; do
  x="$( echo "$REPLY" | tr -d $'\r' )"; echo "$x" >&2
  if [ -z "$x" ]; then break; fi
done
cat <<END | sed 's!^  !!'
  HTTP/1.1 200 OK
  Content-Type: text/plain

  Hello World!
  The time is: $( date '+%F %T' )

  - napp-hello-ncat
END
