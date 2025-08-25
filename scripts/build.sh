#!/usr/bin/env bash
set -euo pipefail

# Make sure both common locations are on PATH
PATH="$HOME/.local/bin:/root/.local/bin:$PATH"

# 1) Try to find an existing rojo
ROJO="$(command -v rojo || true)"
[ -z "$ROJO" ] && [ -x "$HOME/.local/bin/rojo" ] && ROJO="$HOME/.local/bin/rojo"
[ -z "$ROJO" ] && [ -x "/root/.local/bin/rojo" ] && ROJO="/root/.local/bin/rojo"
[ -z "$ROJO" ] && [ -x "./tools/rojo/rojo" ] && ROJO="./tools/rojo/rojo"

# 2) If still missing, download a local copy into the repo (Linux x86_64)
if [ -z "$ROJO" ]; then
  echo "Rojo not found; downloading a local copy…"
  mkdir -p tools/rojo
  cd tools/rojo
  VER="7.5.1"
  unset http_proxy https_proxy HTTP_PROXY HTTPS_PROXY
  export NO_PROXY="*"
  curl -fsSL --retry 5 --retry-all-errors --connect-timeout 15 \
    -o rojo.zip "https://github.com/rojo-rbx/rojo/releases/download/v${VER}/rojo-${VER}-x86_64-unknown-linux-gnu.zip"
  unzip -o rojo.zip >/dev/null
  rm -f rojo.zip
  chmod +x rojo
  cd - >/dev/null
  ROJO="./tools/rojo/rojo"
fi

# 3) Build
"$ROJO" --version
"$ROJO" build --output build.rbxl
echo "Build complete: build.rbxl (git-ignored)"

# Ensure the script is executable in git
git update-index --chmod=+x scripts/build.sh || true
