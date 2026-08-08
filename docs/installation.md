# Installation Guide - Turnip-MV-F6

## Requirements

- POCO F6 (or compatible Adreno 735 device)
- Winlator Ludashi

## Important note about the download

If you download from **GitHub Actions**, the file is an **artifact ZIP**.

You must **extract it first**. Inside you will find the real driver package:

```text
Turnip-MV-F6-Baseline.zip   ← this is the one you import into Ludashi
Turnip-MV-F6-Baseline.zip.sha256
```

Do **not** import the outer artifact ZIP directly.

---

## Steps

1. Download the artifact from Actions (or a Release if available).
2. **Extract** the downloaded ZIP.
3. Take the inner driver ZIP (example: `Turnip-MV-F6-Baseline.zip`).
4. Open **Winlator Ludashi**.
5. Go to **Driver Manager** / **AdrenoTools**.
6. Import the inner driver ZIP.
7. Select the driver **Turnip MV F6 Baseline** (or the name shown in the package).
8. Restart the container / game.

---

## Backup

Always keep a known-good driver as backup before testing experimental builds.
