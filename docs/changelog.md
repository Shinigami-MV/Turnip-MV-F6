# Changelog - Turnip-MV-F6

## v1.0 Baseline (in progress)

- Initial project structure
- Android NDK cross-compile pipeline for ARM64
- AdrenoTools / Winlator Ludashi compatible packaging (`vulkan.ad07xx.so` + `meta.json`)
- GitHub Actions workflow (manual + push triggers)
- Clean Mesa build (default: `mesa-26.1.4`)
- Target device: **POCO F6** (Adreno 735 / Snapdragon 8s Gen 3)
- Target frontend: **Winlator Ludashi**

No custom performance patches yet — this release validates the build and packaging pipeline.
