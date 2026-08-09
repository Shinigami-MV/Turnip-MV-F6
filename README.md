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

## Current version

**v1.2 Performance (F6-R2)** — experimental performance build

| Version                 | Focus                         | Status                    |
|-------------------------|-------------------------------|---------------------------|
| Baseline                | Clean Mesa build + packaging  | Tested                    |
| F6-R1 Stability         | F6-first stability            | Experimental / tested     |
| **F6-R2 Performance**   | `-O3` performance build       | **Ready to build/test**   |
| F6-R3                   | Game-specific optimizations   | Future                    |

### What changed in F6-R2

- Explicit `-O3` + section GC
- LTO disabled (Mesa does not support it)
- Packaging name: **Turnip MV F6-R2 Performance**
- Still clean Mesa source (default `mesa-26.1.4`)
- Compare against R1 on the same game/scene

### Previous test notes (F6-R1)

- Device: POCO F6 (Adreno 735)
- Sample title: SRK Peach Ball
- ~60 FPS, ~40 °C, no issues in that test

---

## Download

- [Releases](https://github.com/Shinigami-MV/Turnip-MV-F6/releases) when published
- Or **Actions** artifacts

> Actions artifact ZIP must be extracted first. Import the inner driver ZIP into Ludashi.

---

## How to use (Winlator Ludashi)

1. Download from Releases or Actions.
2. Extract if needed.
3. Import the driver ZIP.
4. Select **Turnip MV F6-R2 Performance** (or R1 if you want the safer baseline).
5. Keep a backup driver.

### Quick tips

- Artifacts/hangs → `TU_DEBUG=sysmem`
- Swapchain/UI corruption → `WRAPPER_BLIT=1`
- Change one setting at a time

More detail: [`docs/recommended-settings.md`](docs/recommended-settings.md)

---

## How to build (GitHub Actions)

1. Open **Actions**
2. Select **Build Turnip-MV-F6**
3. **Run workflow**
4. Defaults now point to **F6-R2 Performance**
5. Download artifact **Turnip-MV-F6-R2-Performance**

---

## Safety

- Does **not** replace the Android system GPU driver
- Install only through Ludashi / AdrenoTools
- Performance builds can be less stable than R1 on some titles
- Keep R1 as fallback

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
