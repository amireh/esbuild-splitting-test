#!/usr/bin/env bash

esbuild() {
  npx esbuild "$@" \
    --bundle \
    --splitting \
    --format=esm \
    --outdir=dist/esbuild \
    src/index.js
}

rollup() {
  npx rollup "$@" --format=esm --file=dist/rollup/index.js -- src/index.js
}

webpack() {
  npx webpack "$@" --mode=development --entry="$PWD/src/index.js" -o "$PWD/dist/webpack"
}

rm -rf dist

echo "node:"
node src/index.js

echo "webpack:"
webpack --no-stats && node dist/webpack/main.js

echo "rollup:"
rollup --silent && node dist/rollup/index.js

echo "esbuild:"
esbuild --log-level=silent && node dist/esbuild/index.js
