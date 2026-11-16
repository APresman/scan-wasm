#!/bin/bash
# FMJD Tournament Manager: build Scan 3.1 (this fork, with MultiPV) for the browser.
#   tm/build.sh            -> tm/out/scan_tm.{js,wasm,data}
# Needs emsdk (../emsdk, activated) and Scan's data: the evaluation and the 2-3 piece endgame tables
# (from /home/AP/kr/scan/engine/data, the files on hjetten.home.xs4all.nl/scan/scan.html).
set -euo pipefail
here="$(cd "$(dirname "$0")" && pwd)"
src="$(dirname "$here")"
data_src="${SCAN_DATA:-/home/AP/kr/scan/engine/data}"
source "$src/../emsdk/emsdk_env.sh" > /dev/null 2>&1

stage="$here/stage"
rm -rf "$stage" "$here/out"
mkdir -p "$stage/data/bb" "$here/out"
cp "$data_src/eval" "$stage/data/eval"
cp -r "$data_src/bb/2" "$data_src/bb/3" "$stage/data/bb/"

cd "$here/out"
em++ ${EMFLAGS:--O3 -DNDEBUG} -std=c++14 -I"$src" "$src"/*.cpp -o scan_tm.js \
  -s WASM=1 -s ENVIRONMENT=worker -s ALLOW_MEMORY_GROWTH=1 -s INITIAL_MEMORY=134217728 -s STACK_SIZE=8388608 \
  -s EXPORTED_FUNCTIONS='["_main","_scan_command"]' -s EXPORTED_RUNTIME_METHODS='["ccall"]' \
  --pre-js "$here/pre.js" --preload-file "$stage/data@/data"
ls -la "$here/out"
