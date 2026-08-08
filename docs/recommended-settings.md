# Recommended Settings - POCO F6 + Turnip-MV-F6

Priority device: **POCO F6** (Snapdragon 8s Gen 3 / **Adreno 735**)
Frontend: **Winlator Ludashi**

## Driver

Use **Turnip MV F6-R1 Stability** (or newer F6 builds from this repo).

## Starting point (stability first)

1. Import the inner driver ZIP (extract the Actions artifact first).
2. Select the F6 driver in Driver Manager / AdrenoTools.
3. Start with a known-good game setup from Baseline testing.

### DXVK

- Start with **DXVK 2.0-async** if your game already runs well with it.
- If you see black artifacts, try disabling HUD / switching DXVK version.

### Useful environment variables (Ludashi container)

Try these only when needed:

| Variable | When to use |
|----------|-------------|
| `TU_DEBUG=sysmem` | Artifacts, hangs, or weird tiling issues |
| `WRAPPER_BLIT=1` | Corrupted swapchain / UI presentation on Android wrapper path |
| `TU_DEBUG=nolrz` | If still unstable after sysmem |

Do **not** stack many `TU_DEBUG` flags at once. Change one thing at a time.

### General tips for Adreno 735

- Keep resolution moderate while validating stability.
- Keep Box64 preset consistent when comparing drivers.
- Record FPS, 1% lows, temperature and visual bugs.

## What v1.1 focuses on

- Clean upstream Mesa support for Adreno 735
- Packaging and docs oriented to POCO F6 + Ludashi
- Practical stability guidance instead of aggressive experimental hacks

Source-level performance patches can come later in F6-R2.
