#!/usr/bin/env bash
set -e

echo "========================================="
echo "  Jaspr & SCSS Vercel Build Script"
echo "========================================="

# 1. Download & Extract Dart SDK for Linux x64
echo ">>> [1/4] Installing Dart SDK (Linux x64)..."
DART_URL="https://storage.googleapis.com/dart-archive/channels/stable/release/latest/sdk/dartsdk-linux-x64-release.zip"
curl -fsSL "$DART_URL" -o dart-sdk.zip
unzip -q -o dart-sdk.zip
rm -f dart-sdk.zip

export PATH="$PWD/dart-sdk/bin:$HOME/.pub-cache/bin:$PATH"
echo "Dart installed successfully: $(dart --version)"

# 2. Compile SCSS into bundle.css
echo ">>> [2/4] Compiling SCSS..."
npx --yes sass web/styles/scss/main.scss:web/styles/bundle.css --style=compressed

# 3. Install dependencies and Jaspr CLI
echo ">>> [3/4] Fetching dependencies & installing Jaspr CLI..."
dart pub get
dart pub global activate jaspr_cli

# 4. Build Static Site
echo ">>> [4/4] Building Jaspr static site..."
jaspr build

echo "========================================="
echo "  Build completed successfully!"
echo "  Output directory: build/jaspr"
echo "========================================="

