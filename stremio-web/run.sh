#!/bin/sh

set -e

if [[ ${APPLY_PATCHES:-0} -eq 1 ]]; then
	echo "Applying patches..."
	chmod +x ./patches.sh
	sh ./patches.sh
else
	echo "Patches will not be applied this time"
fi

http-server web/ -p 8080 -d false &
http-server shell/ -p 8081 -d false &
node server/server.js
