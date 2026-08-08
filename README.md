# Turnip-MV-F6

**Optimized Mesa Turnip drivers for POCO F6 (Adreno 735 / Snapdragon 8s Gen 3)**  
Focused exclusively on **Winlator Ludashi**

> Custom Vulkan Turnip builds prioritizing performance, stability and compatibility on the POCO F6.

---

## Status notice

**Current builds are experimental / in testing.**

They are safe to try and have worked well in real tests on POCO F6, but the project is still early. Always keep a known-good driver as backup.

---

## Target Device

| Device   | SoC                  | GPU        | Status   |
|----------|----------------------|------------|----------|
| POCO F6  | Snapdragon 8s Gen 3  | Adreno 735 | Primary  |

This project is **POCO F6 first**. Optimizations, testing and packaging are done with this device as priority.

---

## Goal

Provide high-quality, regularly updated Turnip drivers specifically tuned for:

- Winlator **Ludashi** (Bionic)
- Better stability/performance on **Adreno 735**
- Improved game compatibility
- Clean installation via AdrenoTools / Driver Manager

---

## Current version

**v1.1 Stability (F6-R1)** — experimental, tested on device

| Version              | Focus                              | Status                    |
|----------------------|------------------------------------|---------------------------|
| Baseline             | Clean Mesa build + packaging       | Tested                    |
| **F6-R1 Stability**  | F6-first stability packaging/docs  | **Experimental / tested** |
| F6-R2                | Performance patches (Adreno 735)   | Planned                   |
| F6-R3                | Game-specific optimizations        | Future                    |

### Test notes (F6-R1)

- Device: POCO F6 (Adreno 735)
- Mesa: 26.1.4
- Sample title: SRK Peach Ball
- ~60 FPS, ~40 °C for several minutes, no issues observed in that test
- Safe to use for normal testing; keep a backup driver

---

## Download

Prefer **Releases** when available:

- [Releases](https://github.com/Shinigami-MV/Turnip-MV-F6/releases)

You can also download build artifacts from **Actions**.

> If you download from Actions: extract the artifact ZIP first. The installable driver is the ZIP inside.

---

## How to use (Winlator Ludashi)

1. Download from **Releases** (recommended) or Actions.
2. If it is an Actions artifact, **extract** it first.
3. Import the driver ZIP (example: `Turnip-MV-F6-R1-Stability.zip`).
4. In Ludashi → Driver Manager / AdrenoTools, select **Turnip MV F6-R1 Stability**.
5. Keep a known-good driver as backup.

### Quick stability tips for Adreno 735

- If artifacts/hangs: try `TU_DEBUG=sysmem`
- If swapchain/UI corruption: try `WRAPPER_BLIT=1`
- Change one setting at a time

More detail in [`docs/recommended-settings.md`](docs/recommended-settings.md).

---

## How to build (GitHub Actions)

1. Open the **Actions** tab.
2. Select **Build Turnip-MV-F6**.
3. Click **Run workflow**.
4. Defaults:
   - `mesa_ref` → `mesa-26.1.4`
   - `build_name` → `Turnip MV F6-R1 Stability`
5. Wait for the build to finish.
6. Download the artifact **Turnip-MV-F6-R1-Stability**.

---

## Recommended Testing Protocol

Keep everything identical when comparing:

- Same game + save / scene
- Same resolution
- Same DXVK version
- Same Box64 preset
- Same CPU affinity
- Same FPS limit

**Record:** average FPS / 1% lows, temperature, artifacts, crashes, shader stutter.

---

## Safety

- Does **not** replace the Android system GPU driver
- Install only through Ludashi / AdrenoTools
- Keep a working backup driver
- Builds are experimental; tested so far without problems on POCO F6, but more titles still need validation

---

## Project Structure

```text
Turnip-MV-F6/
├── .github/workflows/
├── patches/
├── scripts/
│   ├── build.sh
│   └── package.sh
├── docs/
│   ├── installation.md
│   ├── recommended-settings.md
│   └── changelog.md
└── README.md
```

---

## Related Projects

- [Turnip-MV](https://github.com/Shinigami-MV/Turnip-MV)
- [Turnip-MV-Frost-GlibC](https://github.com/Shinigami-MV/Turnip-MV-Frost-GlibC)

---

## License

- Project scripts & packaging: **MIT**
- Mesa: upstream licenses

---

**Created by Shinigami-MV (AlexMV)**  
Dedicated to the POCO F6 community.
