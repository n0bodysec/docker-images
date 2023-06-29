#!/bin/sh

if [ ${FIX_UNSUPPORTED_MEDIA:-0} -eq 1 ]; then
	echo "Applying patch for HTTP 415 Unsupported Media Type..."
	sed -i -E "s|(var first = req\.params\.first)|if (req.params.first === 'hlsv2') { req.params.first = req.query.mediaURL.split('/')[3]; req.params.second = req.query.mediaURL.split('/')[4]; }\n    \1|" $WORKDIR/server/server.js
	sed -i -E 's/HLS.masterMultiPlaylistMiddleware\)/HLS.masterPlaylistMiddleware\)/' $WORKDIR/server/server.js
fi
