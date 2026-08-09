# Changelog - Turnip-MV-F6

## v1.2 Performance (F6-R2)

**Status:** Experimental / performance testing

- Focus: **more performance on POCO F6 (Adreno 735)**
- Build changes:
  - `-O3`
  - section GC (`-ffunction-sections` / `-fdata-sections` + `--gc-sections`)
  - LTO enabled (`-Db_lto=true`)
- Packaging renamed to **Turnip MV F6-R2 Performance**
- Artifact name: `Turnip-MV-F6-R2-Performance`
- Still based on clean Mesa (default `mesa-26.1.4`)
- Keep **F6-R1 Stability** as backup if a game becomes less stable

Goal: measure real FPS/temp gains vs R1 on the same scenes.

## v1.1 Stability (F6-R1)

**Status:** Experimental / in testing — safe to use, keep a backup driver.

- Focus: **stability on POCO F6 (Adreno 735)** with Winlator Ludashi
- Packaging renamed to **Turnip MV F6-R1 Stability**
- Artifact name: `Turnip-MV-F6-R1-Stability`
- Added in-package `README-F6.txt` with quick install notes
- Expanded recommended settings for Adreno 735 / Ludashi
- Based on clean Mesa (default `mesa-26.1.4`) — A735 is upstream-supported
- No aggressive A710/A720 or A8xx hacks

### Device test notes

- POCO F6 (Adreno 735)
- Mesa 26.1.4 / DXVK 2.0-async
- Sample game: SRK Peach Ball
- ~60 FPS, ~40 °C over several minutes, no issues observed in that test

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
