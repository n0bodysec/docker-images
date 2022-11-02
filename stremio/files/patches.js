/**
 * 
 * @name Stremio JavaScript Patcher
 * @author n0bodysec
 * @description A simple JS that is executed on document load. You can apply custom client patches with it.
 * @example https://gist.github.com/n0bodysec/2896438d8578f13c4a9e30373f7200c1
 * This script can be loaded using nginx sub_filter
 * sub_filter '</body>' '<script src="https://your.stremio.url/patches.js"></script></body>';
 * sub_filter_once on;
 * 
 */

window.addEventListener('DOMContentLoaded', async (event) =>
{
	const isLegacy = localStorage.streamingServerUrl !== undefined;
	console.log(`[STREMIO PATCHER] Detected ${isLegacy ? 'Legacy' : 'Web'} UI`);
});
