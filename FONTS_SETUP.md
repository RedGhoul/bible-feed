# Custom Fonts Setup Instructions

This document explains how to add custom fonts (Literata and Inter) to the Bible Feed app.

## Fonts to Download

### 1. Literata (Reading/Display Font)
- **Source:** [Google Fonts - Literata](https://fonts.google.com/specimen/Literata)
- **License:** Open Font License
- **Weights needed:**
  - Regular (400)
  - Medium (500)
  - SemiBold (600)
  - Bold (700)

**Download steps:**
1. Visit https://fonts.google.com/specimen/Literata
2. Click "Download family"
3. Extract the ZIP file
4. Copy these files from the `static` folder:
   - `Literata-Regular.ttf`
   - `Literata-Medium.ttf`
   - `Literata-SemiBold.ttf`
   - `Literata-Bold.ttf`

### 2. Inter (UI Font)
- **Source:** [Google Fonts - Inter](https://fonts.google.com/specimen/Inter)
- **License:** Open Font License
- **Weights needed:**
  - Regular (400)
  - Medium (500)
  - SemiBold (600)
  - Bold (700)

**Download steps:**
1. Visit https://fonts.google.com/specimen/Inter
2. Click "Download family"
3. Extract the ZIP file
4. Copy these files from the `static` folder:
   - `Inter-Regular.ttf`
   - `Inter-Medium.ttf`
   - `Inter-SemiBold.ttf`
   - `Inter-Bold.ttf`

## Installation Steps

### 1. Create fonts directory
```bash
mkdir -p fonts
```

### 2. Copy font files
Place all downloaded `.ttf` files into the `fonts/` directory:
```
fonts/
├── Inter-Bold.ttf
├── Inter-Medium.ttf
├── Inter-Regular.ttf
├── Inter-SemiBold.ttf
├── Literata-Bold.ttf
├── Literata-Medium.ttf
├── Literata-Regular.ttf
└── Literata-SemiBold.ttf
```

### 3. Update pubspec.yaml
The font configuration has already been added to `pubspec.yaml`. It should look like this:

```yaml
flutter:
  fonts:
    - family: Literata
      fonts:
        - asset: fonts/Literata-Regular.ttf
        - asset: fonts/Literata-Medium.ttf
          weight: 500
        - asset: fonts/Literata-SemiBold.ttf
          weight: 600
        - asset: fonts/Literata-Bold.ttf
          weight: 700
    - family: Inter
      fonts:
        - asset: fonts/Inter-Regular.ttf
        - asset: fonts/Inter-Medium.ttf
          weight: 500
        - asset: fonts/Inter-SemiBold.ttf
          weight: 600
        - asset: fonts/Inter-Bold.ttf
          weight: 700
```

### 4. Run Flutter commands
```bash
flutter pub get
flutter clean
flutter run
```

## Verification

To verify fonts are working:
1. Run the app
2. Check that text appears in Literata (serif) and Inter (sans-serif)
3. If fonts don't load, they will fall back to Georgia and Roboto

## Alternative: Use System Fonts Only

If you prefer not to add custom fonts, the app will automatically fall back to:
- **Literata → Georgia** (serif)
- **Inter → Roboto** (sans-serif)

The typography system in `_typography.dart` already includes these fallbacks.

## License Information

Both fonts are licensed under the Open Font License (OFL), which allows:
- Free use in commercial and non-commercial projects
- Bundling with applications
- Modification (with different font names)

See individual font repositories for full license details.
