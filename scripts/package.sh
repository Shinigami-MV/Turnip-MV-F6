#!/usr/bin/env bash
set -euo pipefail

# Turnip-MV-F6 v1.0 Baseline - Packaging
# Creates AdrenoTools / Winlator Ludashi compatible ZIP

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
STAGING="$ROOT_DIR/staging"
OUTPUT="$ROOT_DIR/output"

BUILD_NAME="${BUILD_NAME:-Turnip MV F6 Baseline}"
MESA_REF="${MESA_REF:-mesa-26.1.4}"
RELEASE_NAME="${RELEASE_NAME:-Turnip-MV-F6-Baseline}"

mkdir -p "$OUTPUT"

if [[ ! -f "$STAGING/vulkan.ad07xx.so" ]]; then
    echo "ERROR: Driver library was not found:"
    echo "$STAGING/vulkan.ad07xx.so"
    exit 1
fi

COMMIT="unknown"

if [[ -f "$ROOT_DIR/mesa-commit.txt" ]]; then
    COMMIT="$(cat "$ROOT_DIR/mesa-commit.txt")"
fi

cat > "$STAGING/meta.json" <<EOF
{
  "schemaVersion": 1,
  "name": "$BUILD_NAME",
  "description": "Turnip-MV-F6 Baseline for POCO F6 (Adreno 735 / Snapdragon 8s Gen 3). Optimized for Winlator Ludashi.",
  "author": "Shinigami-MV",
  "packageVersion": "1",
  "vendor": "Mesa",
  "driverVersion": "$MESA_REF ($COMMIT)",
  "minApi": 28,
  "libraryName": "vulkan.ad07xx.so"
}
EOF

if [[ -f "$ROOT_DIR/mesa-commit.txt" ]]; then
    cp "$ROOT_DIR/mesa-commit.txt" "$STAGING/mesa-commit.txt"
else
    echo "$COMMIT" > "$STAGING/mesa-commit.txt"
fi

cd "$STAGING"

zip -9 -r "$OUTPUT/$RELEASE_NAME.zip" \
    meta.json \
    vulkan.ad07xx.so \
    SHA256SUMS.txt \
    mesa-commit.txt

cd "$ROOT_DIR"

sha256sum "$OUTPUT/$RELEASE_NAME.zip" \
    > "$OUTPUT/$RELEASE_NAME.zip.sha256"

echo
echo "========================================"
echo " Package created successfully"
echo " $OUTPUT/$RELEASE_NAME.zip"
echo "========================================"
