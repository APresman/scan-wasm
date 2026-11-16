# Scan 3.1 for FMJD Tournament Manager (fork of lidraughts' scan-wasm)

Scan 3.1 by Fabien Letouzey (GPL-3.0), as built for the browser by lidraughts (github.com/RoepStoep/scan-wasm),
with these changes for FMJD Tournament Manager (tm.fmjd.org), 2026:

- **MultiPV**: a new engine parameter `multipv` (1-10, default 1). After the best line of each iteration the root is
  searched again without the moves already chosen. Line 1 is reported as before (`info depth=...`); lines 2..N after
  the iteration as `info multipv=<k> depth=... score=... pv=...`. With `multipv` 1 the engine plays and reports
  exactly as before (checked line by line against lidraughts' build).
- Builds with a current Emscripten: `#include <atomic>` in search.cpp, an 8 MB stack (`tm/build.sh`).
- `tm/pre.js`: the Web Worker glue (commands in as messages, output out as messages), as lidraughts' build.

Build: `tm/build.sh` (needs emsdk beside this folder and Scan's data files: eval, bb/2, bb/3).
