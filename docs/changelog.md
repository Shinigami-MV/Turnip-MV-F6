# Changelog - Turnip-MV-F6

## v1.1 Stability (F6-R1)

- Focus: **stability on POCO F6 (Adreno 735)** with Winlator Ludashi
- Packaging renamed to **Turnip MV F6-R1 Stability**
- Artifact name: `Turnip-MV-F6-R1-Stability`
- Added in-package `README-F6.txt` with quick install notes
- Expanded recommended settings for Adreno 735 / Ludashi
- Still based on clean Mesa (default `mesa-26.1.4`) — A735 is upstream-supported
- No aggressive A710/A720 or A8xx hacks (those target other GPUs)

Goal of this revision: more reliable day-to-day use on the F6 after the Baseline validation.

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
