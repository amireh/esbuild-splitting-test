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
  npx webpack "$@" \
    --entry="$PWD/src/index.js" \
    --output-path="$PWD/dist/webpack" &&
  echo '{"type": "commonjs"}' > "$PWD"/dist/webpack/package.json
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
