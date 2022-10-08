#!/bin/sh

# Only if you re-use containers (please do not do that)
cp server/server.js.bak server/server.js

# Fix for HTTP 415 Unsupported Media Type
if [ ${FIX_UNSUPPORTED_MEDIA:-0} -eq 1 ]; then
	echo "Applying patch for HTTP 415 Unsupported Media Type..."
	sed -i -E "s|(var first = req\.params\.first)|if (req.params.first === 'hlsv2') { req.params.first = req.query.mediaURL.split('/')[3]; req.params.second = req.query.mediaURL.split('/')[4]; }\n    \1|" server/server.js
	sed -i -E 's/HLS.masterMultiPlaylistMiddleware\)/HLS.masterPlaylistMiddleware\)/' server/server.js
fi
