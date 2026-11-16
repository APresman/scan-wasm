// FMJD Tournament Manager: Scan in a Web Worker, as lidraughts' build (static/js/scan.js speaks to it).
// Commands come in as the worker's messages (queued until the engine is ready), each line Scan writes goes out as one.
var tmQueue = [];
onmessage = function (e) {
  if (e.data == 'quit') close();
  else if (tmQueue !== null) tmQueue.push(e.data);
  else Module.ccall('scan_command', 'number', ['string'], [e.data]);
};
Module['print'] = function (text) { postMessage(text); };
Module['printErr'] = function (text) {};
Module['postRun'] = [function () {
  for (var i = 0; i < tmQueue.length; i++) Module.ccall('scan_command', 'number', ['string'], [tmQueue[i]]);
  tmQueue = null;
}];
// the engine's own files carry the build's version, so a browser never mixes an older .wasm or .data with this script
Module['locateFile'] = function (file) { return file + '?v=tm1'; };
