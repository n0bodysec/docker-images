#!/bin/sh -e

# create file if it doesn't exist
touch -a /root/.stremio-server/server-settings.json

# restore a fresh server.js
# cp server/server.js.bak server/server.js

# run patches
if [[ ${APPLY_PATCHES:-0} -eq 1 ]]; then
	if [ ! -d "patches" ]; then
		echo "Patches folder does not exist. Skipping patches..."
	else
		echo "Applying patches..."
		for file in patches/*.sh; do
			echo "Executing patch $file"
			sh $file
		done
	fi
else
	echo "Patches will not be applied this time"
fi

# start services
http-server web/ -p 8080 -d false &
http-server shell/ -p 8081 -d false &
node server/server.js
