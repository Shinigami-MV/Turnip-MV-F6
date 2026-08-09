#!/usr/bin/env bash
set -euo pipefail

# Turnip-MV-F6 v1.2 Performance (F6-R2)
# Packaging for AdrenoTools / Winlator Ludashi
# Priority device: POCO F6 (Adreno 735)

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
STAGING="$ROOT_DIR/staging"
OUTPUT="$ROOT_DIR/output"

BUILD_NAME="${BUILD_NAME:-Turnip MV F6-R2 Performance}"
MESA_REF="${MESA_REF:-mesa-26.1.4}"
RELEASE_NAME="${RELEASE_NAME:-Turnip-MV-F6-R2-Performance}"

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
  "description": "Turnip-MV-F6 R2 Performance for POCO F6 (Adreno 735 / Snapdragon 8s Gen 3). Built with -O3 + LTO for Winlator Ludashi.",
  "author": "Shinigami-MV",
  "packageVersion": "1.2",
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

cat > "$STAGING/README-F6.txt" <<EOF
Turnip-MV-F6 R2 Performance
Device priority: POCO F6 (Adreno 735)

Import this ZIP in Winlator Ludashi (Driver Manager / AdrenoTools).

This is a PERFORMANCE build (-O3 + LTO).
It is still experimental. Keep F6-R1 Stability as backup.

Recommended starting point:
- DXVK 2.0-async if it already works for your game
- Present Mode: Fifo
- If artifacts/hangs: TU_DEBUG=sysmem
- If swapchain/UI corruption: WRAPPER_BLIT=1

Compare FPS and temperature against F6-R1 Stability on the same scene.
EOF

cd "$STAGING"

zip -9 -r "$OUTPUT/$RELEASE_NAME.zip" \
    meta.json \
    vulkan.ad07xx.so \
    SHA256SUMS.txt \
    mesa-commit.txt \
    README-F6.txt

cd "$ROOT_DIR"

sha256sum "$OUTPUT/$RELEASE_NAME.zip" \
    > "$OUTPUT/$RELEASE_NAME.zip.sha256"

echo
echo "========================================"
echo " Package created successfully"
echo " $OUTPUT/$RELEASE_NAME.zip"
echo "========================================"
