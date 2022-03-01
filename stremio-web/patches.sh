#!/bin/sh

FIX_CORS=${FIX_CORS:-0}
FIX_UNSUPPORTED_MEDIA=${FIX_UNSUPPORTED_MEDIA:-0}

if  [ "$FIX_CORS" -eq 1 ]; then
	sed -i 's/if (ok) enginefs.sendCORSHeaders/if (true) enginefs.sendCORSHeaders/' server/server.js
fi

if [ "$FIX_UNSUPPORTED_MEDIA" -eq 1 ]; then
	sed -i -E "s|(var first = req\.params\.first)|if (req.params.first === 'hlsv2') { req.params.first = req.query.mediaURL.split('/')[3]; req.params.second = req.query.mediaURL.split('/')[4]; }\n    \1|" server/server.js
	sed -i -E 's/HLS.masterMultiPlaylistMiddleware\)/HLS.masterPlaylistMiddleware\)/' server/server.js
fi