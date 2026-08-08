# Turnip-MV-F6

**Optimized Mesa Turnip drivers for POCO F6 (Adreno 735 / Snapdragon 8s Gen 3)**  
Focused exclusively on **Winlator Ludashi**

> Custom Vulkan Turnip builds prioritizing performance, stability and compatibility on the POCO F6.

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
- Better performance on Adreno 735
- Improved game compatibility
- Clean and easy installation via AdrenoTools / Driver Manager

---

## Status

**Current stage:** Project initialization  
First optimized builds coming soon.

| Version          | Focus                              | Status     |
|------------------|------------------------------------|------------|
| Baseline         | Clean Mesa build + packaging       | Planned    |
| F6-R1            | Stability improvements             | Planned    |
| F6-R2            | Performance patches (Adreno 735)   | Planned    |
| F6-R3            | Game-specific optimizations        | Future     |

---

## How to use (Winlator Ludashi)

1. Download the latest release from the [Releases](https://github.com/Shinigami-MV/Turnip-MV-F6/releases) page.
2. Open **Winlator Ludashi**.
3. Go to **Driver Manager** / **AdrenoTools**.
4. Import the downloaded `.zip`.
5. Select the driver **Turnip MV F6** (or the name shown in the package).
6. Always keep a known-good driver as backup.

---

## Recommended Testing Protocol

When comparing drivers, keep everything identical:

- Same game + save / scene
- Same resolution
- Same DXVK version
- Same Box64 preset
- Same CPU affinity
- Same FPS limit

**Record:**
- Average FPS / 1% lows
- Temperature after 10 and 20 minutes
- Visual artifacts
- Crashes
- Shader stutter

---

## Safety

- This driver does **not** replace the system Android GPU driver.
- Install only through Winlator Ludashi / AdrenoTools.
- Keep a working driver as backup.
- If you experience crashes or severe graphical corruption, remove the experimental package.

---

## Project Structure (planned)

```text
Turnip-MV-F6/
├── .github/workflows/     # Automated builds
├── patches/               # Adreno 735 specific patches
├── scripts/
│   ├── build.sh
│   └── package.sh
├── docs/
└── README.md
```

---

## Related Projects

- [Turnip-MV](https://github.com/Shinigami-MV/Turnip-MV) → General experimental builds
- [Turnip-MV-Frost-GlibC](https://github.com/Shinigami-MV/Turnip-MV-Frost-GlibC) → Version for Winlator Frost (GlibC)

---

## License

- Project scripts & packaging: **MIT**
- Mesa: retains its original upstream licenses

---

**Created by Shinigami-MV (AlexMV)**  
Dedicated to the POCO F6 community.
