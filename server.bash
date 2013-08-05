#!/bin/bash
set -e
cat <<END | sed 's!^  !!'
  HTTP/1.1 200 OK
  Content-Type: text/plain

  Hello World!
  The time is: $( date '+%F %T' )

  - napp-hello-ncat
END
