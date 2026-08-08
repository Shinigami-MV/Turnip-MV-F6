# Installation Guide - Turnip-MV-F6

## Requirements

- POCO F6 (Adreno 735)
- Winlator Ludashi

## Important note about the download

If you download from **GitHub Actions**, the file is an **artifact ZIP**.

You must **extract it first**. Inside you will find the real driver package, for example:

```text
Turnip-MV-F6-R1-Stability.zip   ← import this one in Ludashi
Turnip-MV-F6-R1-Stability.zip.sha256
```

Do **not** import the outer artifact ZIP directly.

---

## Steps

1. Download the artifact from Actions (or a Release if available).
2. **Extract** the downloaded ZIP.
3. Take the inner driver ZIP (example: `Turnip-MV-F6-R1-Stability.zip`).
4. Open **Winlator Ludashi**.
5. Go to **Driver Manager** / **AdrenoTools**.
6. Import the inner driver ZIP.
7. Select **Turnip MV F6-R1 Stability** (or the name shown in the package).
8. Restart the container / game.

---

## If something looks unstable

Try one change at a time:

1. `TU_DEBUG=sysmem`
2. `WRAPPER_BLIT=1`
3. Different DXVK version

See `docs/recommended-settings.md` for more detail.

---

## Backup

Always keep a known-good driver as backup before testing experimental builds.
