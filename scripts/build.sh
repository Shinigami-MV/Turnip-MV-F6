#!/usr/bin/env bash
set -euo pipefail

# Turnip-MV-F6 v1.2 Performance (F6-R2)
# Build Turnip (Mesa Freedreno) for Android ARM64
# Target: POCO F6 (Adreno 735) + Winlator Ludashi
# Focus: more aggressive release optimizations

: "${ANDROID_NDK_ROOT:?ANDROID_NDK_ROOT is not set}"

API_LEVEL="${API_LEVEL:-34}"
PLATFORM_SDK="${PLATFORM_SDK:-34}"

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
MESA_DIR="$ROOT_DIR/mesa"
BUILD_DIR="$ROOT_DIR/build-android-aarch64"
STAGING_DIR="$ROOT_DIR/staging"

TOOLCHAIN="$ANDROID_NDK_ROOT/toolchains/llvm/prebuilt/linux-x86_64/bin"
CROSS_FILE="$ROOT_DIR/android-aarch64.ini"

echo "========================================"
echo " Turnip-MV-F6 v1.2 Performance (F6-R2)"
echo " Device: POCO F6 (Adreno 735)"
echo " Target: Winlator Ludashi"
echo " Mode:   Performance"
echo "========================================"
echo "Mesa source: $MESA_DIR"
echo "Build dir:   $BUILD_DIR"
echo "NDK:         $ANDROID_NDK_ROOT"
echo "API level:   $API_LEVEL"
echo "========================================"

if [[ ! -d "$MESA_DIR" ]]; then
    echo "ERROR: Mesa source directory not found:"
    echo "$MESA_DIR"
    exit 1
fi

if [[ ! -d "$TOOLCHAIN" ]]; then
    echo "ERROR: Android NDK toolchain not found:"
    echo "$TOOLCHAIN"
    exit 1
fi

# Android ARM64 cross-compilation file.
# /bin/false prevents pkg-config from picking host x86_64 libs.
cat > "$CROSS_FILE" <<EOF
[constants]
ndk_path = '$ANDROID_NDK_ROOT'
toolchain = ndk_path / 'toolchains/llvm/prebuilt/linux-x86_64/bin'

[binaries]
ar = toolchain / 'llvm-ar'
c = ['ccache', toolchain / 'aarch64-linux-android${API_LEVEL}-clang']
cpp = ['ccache', toolchain / 'aarch64-linux-android${API_LEVEL}-clang++', '-fno-exceptions', '-fno-unwind-tables', '-fno-asynchronous-unwind-tables']
c_ld = 'lld'
cpp_ld = 'lld'
strip = toolchain / 'llvm-strip'
ranlib = toolchain / 'llvm-ranlib'
nm = toolchain / 'llvm-nm'
pkg-config = '/bin/false'

[built-in options]
c_args = ['-O3', '-ffunction-sections', '-fdata-sections']
cpp_args = ['-O3', '-ffunction-sections', '-fdata-sections']
c_link_args = ['-Wl,--gc-sections']
cpp_link_args = ['-Wl,--gc-sections']

[host_machine]
system = 'android'
cpu_family = 'aarch64'
cpu = 'armv8'
endian = 'little'

[properties]
needs_exe_wrapper = true
EOF

echo "Generated cross file:"
cat "$CROSS_FILE"

rm -rf "$BUILD_DIR"
rm -rf "$STAGING_DIR"

echo
echo "Configuring Mesa (Freedreno / Turnip) [Performance]..."

meson setup "$BUILD_DIR" "$MESA_DIR" \
    --cross-file "$CROSS_FILE" \
    --buildtype=release \
    --strip \
    -Db_ndebug=true \
    -Db_lto=true \
    -Dplatforms=android \
    -Dplatform-sdk-version="$PLATFORM_SDK" \
    -Dandroid-stub=true \
    -Dandroid-libbacktrace=disabled \
    -Degl=disabled \
    -Dgbm=disabled \
    -Dglx=disabled \
    -Dgallium-drivers= \
    -Dvulkan-drivers=freedreno \
    -Dfreedreno-kmds=kgsl \
    -Dbuild-tests=false \
    -Dtools= \
    -Dvalgrind=disabled \
    -Dlibarchive:zlib=disabled \
    -Dlibarchive:bz2lib=disabled \
    -Dlibarchive:libb2=disabled \
    -Dlibarchive:iconv=disabled \
    -Dlibarchive:lz4=disabled \
    -Dlibarchive:zstd=disabled \
    -Dlibarchive:lzma=disabled \
    -Dlibarchive:lzo2=disabled \
    -Dlibarchive:cng=disabled \
    -Dlibarchive:openssl=disabled \
    -Dlibarchive:xml2=disabled \
    -Dlibarchive:expat=disabled \
    -Dlibarchive:regex=disabled \
    -Dlibarchive:xattr=disabled \
    -Dlibarchive:acl=disabled \
    -Dlibarchive:tests=disabled \
    -Db_ndebug=true

echo
echo "Compiling Turnip (Performance)..."

meson compile \
    -C "$BUILD_DIR" \
    -j "$(nproc)"

LIB_PATH="$(find "$BUILD_DIR" \
    -type f \
    -name 'libvulkan_freedreno.so' \
    -print \
    -quit)"

if [[ -z "$LIB_PATH" || ! -f "$LIB_PATH" ]]; then
    echo "ERROR: libvulkan_freedreno.so was not produced."
    echo
    echo "Possible Vulkan/Freedreno libraries found:"

    find "$BUILD_DIR" \
        -maxdepth 10 \
        -type f \
        \( -name '*vulkan*.so' -o -name '*freedreno*.so' \) \
        -print || true

    exit 1
fi

mkdir -p "$STAGING_DIR"

cp "$LIB_PATH" "$STAGING_DIR/vulkan.ad07xx.so"

"$TOOLCHAIN/llvm-strip" \
    --strip-unneeded \
    "$STAGING_DIR/vulkan.ad07xx.so" || true

echo
echo "Produced driver:"
ls -lh "$STAGING_DIR/vulkan.ad07xx.so"

sha256sum "$STAGING_DIR/vulkan.ad07xx.so" \
    | tee "$STAGING_DIR/SHA256SUMS.txt"

echo
echo "========================================"
echo " Turnip-MV-F6 Performance build completed"
echo " Driver: $STAGING_DIR/vulkan.ad07xx.so"
echo "========================================"
