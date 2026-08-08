# Changelog - Turnip-MV-F6

## v1.0 Baseline

- Initial project structure
- Android NDK cross-compile pipeline for ARM64
- AdrenoTools / Winlator Ludashi compatible packaging (`vulkan.ad07xx.so` + `meta.json`)
- GitHub Actions workflow (manual + push triggers)
- Clean Mesa build (default: `mesa-26.1.4`)
- Target device: **POCO F6** (Adreno 735 / Snapdragon 8s Gen 3)
- Target frontend: **Winlator Ludashi**
- Tested successfully on device (DXVK 2.0-async, ~60 FPS in sample title)

**Note:** When downloading from Actions, extract the artifact ZIP first. The installable driver is the ZIP inside.

No custom performance patches yet — this release validates the build and packaging pipeline.
