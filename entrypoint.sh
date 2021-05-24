#!/bin/bash

set -eu -o pipefail

if [ $# -ne 1 ]; then
    cat <<EOF
Usage: $0 FILENAME

Monitors FILENAME for changes and reports when they happen
EOF
    exit 1
fi

# For docker
trap "echo Caught SIGINT.  Terminating.; exit 0" INT

file="$1"
ls -lH "$file"

touch -r "$file" /tmp/timestamp

while true; do
    # 1 second resolution
    if [ "$file" -nt /tmp/timestamp ]; then
        echo "$file changed"
        ls -lH "$file"
        touch -r "$file" /tmp/timestamp
    fi
    sleep 1
done
