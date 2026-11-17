# scan-wasm for FMJD Tournament Manager

This branch (`tm-multipv`) is the build of Scan 3.1 that [FMJD Tournament Manager](https://tm.fmjd.org) runs in the
browser for its game analysis. It adds **MultiPV** (the engine's best lines, not only the best one, at each depth;
engine parameter `multipv`) and builds with a current Emscripten. With `multipv` 1 it plays and reports exactly as
lidraughts' build. The changes and the build are described in [tm/README.md](tm/README.md).

Scan 3.1 is by Fabien Letouzey; this WebAssembly version was made by lidraughts (RoepStoep). GPL-3.0, as the original.

---

# scan-wasm
Modified version of Fabien Letouzey's draughts engine Scan 3.1 for lidraughts

Used for client side analysis with WASM / asm.js 

Excludes bitbases / eval files, they can be found on hjetten.home.xs4all.nl/scan/scan.html

Original Scan 3.1 sources on github.com/rhalbersma/scan