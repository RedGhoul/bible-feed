import 'package:flutter/material.dart';

/// Application typography system with custom fonts and Material 3 type scale
///
/// Uses Literata for reading/display text and Inter for UI elements,
/// creating a professional, readable experience optimized for scripture.
class AppTypography {
  AppTypography._();

  // ============================================================================
  // FONT FAMILIES
  // ============================================================================

  /// Display and reading font - Literata
  ///
  /// A serif font designed specifically for digital reading with excellent
  /// legibility at various sizes. Evokes traditional Bible typography.
  static const String displayFont = 'Literata';

  /// Body text font - Literata
  ///
  /// Same as display for consistency in reading experience.
  static const String bodyFont = 'Literata';

  /// UI elements font - Inter
  ///
  /// A modern, clean sans-serif for labels, buttons, and UI chrome.
  static const String uiFont = 'Inter';

  // ============================================================================
  // FALLBACK TO SYSTEM FONTS
  // ============================================================================

  /// When custom fonts are not available, use these system font families
  static const String fallbackDisplayFont = 'Georgia';
  static const String fallbackBodyFont = 'Georgia';
  static const String fallbackUiFont = 'Roboto';

  // ============================================================================
  // TEXT THEME BUILDER
  // ============================================================================

  /// Creates the complete TextTheme for the application
  ///
  /// Follows Material 3 type scale with custom fonts applied.
  /// Falls back to system fonts if custom fonts are unavailable.
  static TextTheme textTheme(ColorScheme colorScheme) {
    return TextTheme(
      // ========================================================================
      // DISPLAY STYLES (Large headings, hero text)
      // ========================================================================

      displayLarge: TextStyle(
        fontFamily: displayFont,
        fontFamilyFallback: const [fallbackDisplayFont],
        fontSize: 57,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.25,
        height: 1.12,
        color: colorScheme.onSurface,
      ),

      displayMedium: TextStyle(
        fontFamily: displayFont,
        fontFamilyFallback: const [fallbackDisplayFont],
        fontSize: 45,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
        height: 1.16,
        color: colorScheme.onSurface,
      ),

      displaySmall: TextStyle(
        fontFamily: displayFont,
        fontFamilyFallback: const [fallbackDisplayFont],
        fontSize: 36,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
        height: 1.22,
        color: colorScheme.onSurface,
      ),

      // ========================================================================
      // HEADLINE STYLES (Section headers, prominent text)
      // ========================================================================

      headlineLarge: TextStyle(
        fontFamily: uiFont,
        fontFamilyFallback: const [fallbackUiFont],
        fontSize: 32,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
        height: 1.25,
        color: colorScheme.onSurface,
      ),

      headlineMedium: TextStyle(
        fontFamily: uiFont,
        fontFamilyFallback: const [fallbackUiFont],
        fontSize: 28,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
        height: 1.29,
        color: colorScheme.onSurface,
      ),

      headlineSmall: TextStyle(
        fontFamily: uiFont,
        fontFamilyFallback: const [fallbackUiFont],
        fontSize: 24,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
        height: 1.33,
        color: colorScheme.onSurface,
      ),

      // ========================================================================
      // TITLE STYLES (Card headers, dialog titles)
      // ========================================================================

      titleLarge: TextStyle(
        fontFamily: bodyFont,
        fontFamilyFallback: const [fallbackBodyFont],
        fontSize: 22,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
        height: 1.27,
        color: colorScheme.onSurface,
      ),

      titleMedium: TextStyle(
        fontFamily: bodyFont,
        fontFamilyFallback: const [fallbackBodyFont],
        fontSize: 18,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.15,
        height: 1.33,
        color: colorScheme.onSurface,
      ),

      titleSmall: TextStyle(
        fontFamily: bodyFont,
        fontFamilyFallback: const [fallbackBodyFont],
        fontSize: 16,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.1,
        height: 1.38,
        color: colorScheme.onSurface,
      ),

      // ========================================================================
      // BODY STYLES (Main reading text, paragraphs)
      // ========================================================================

      bodyLarge: TextStyle(
        fontFamily: bodyFont,
        fontFamilyFallback: const [fallbackBodyFont],
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
        height: 1.5,
        color: colorScheme.onSurface,
      ),

      bodyMedium: TextStyle(
        fontFamily: bodyFont,
        fontFamilyFallback: const [fallbackBodyFont],
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        height: 1.43,
        color: colorScheme.onSurface,
      ),

      bodySmall: TextStyle(
        fontFamily: bodyFont,
        fontFamilyFallback: const [fallbackBodyFont],
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
        height: 1.33,
        color: colorScheme.onSurfaceVariant,
      ),

      // ========================================================================
      // LABEL STYLES (Buttons, chips, tabs)
      // ========================================================================

      labelLarge: TextStyle(
        fontFamily: uiFont,
        fontFamilyFallback: const [fallbackUiFont],
        fontSize: 14,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.1,
        height: 1.43,
        color: colorScheme.onSurface,
      ),

      labelMedium: TextStyle(
        fontFamily: uiFont,
        fontFamilyFallback: const [fallbackUiFont],
        fontSize: 12,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5,
        height: 1.33,
        color: colorScheme.onSurface,
      ),

      labelSmall: TextStyle(
        fontFamily: uiFont,
        fontFamilyFallback: const [fallbackUiFont],
        fontSize: 11,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5,
        height: 1.45,
        color: colorScheme.onSurface,
      ),
    );
  }

  // ============================================================================
  // CUSTOM TEXT STYLES
  // ============================================================================

  /// Large book/chapter display (for feed cards)
  static TextStyle bookChapterLarge(ColorScheme colorScheme) {
    return TextStyle(
      fontFamily: bodyFont,
      fontFamilyFallback: const [fallbackBodyFont],
      fontSize: 30,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
      height: 1.2,
      color: colorScheme.onSurface,
    );
  }

  /// Medium book/chapter display (for compact feeds)
  static TextStyle bookChapterMedium(ColorScheme colorScheme) {
    return TextStyle(
      fontFamily: bodyFont,
      fontFamilyFallback: const [fallbackBodyFont],
      fontSize: 24,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
      height: 1.25,
      color: colorScheme.onSurface,
    );
  }

  /// List wheel text (for book/chapter pickers)
  static TextStyle listWheelText(ColorScheme colorScheme) {
    return TextStyle(
      fontFamily: bodyFont,
      fontFamilyFallback: const [fallbackBodyFont],
      fontSize: 23,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
      height: 1.3,
      color: colorScheme.onSurface,
    );
  }

  /// List wheel text (compact variant)
  static TextStyle listWheelTextCompact(ColorScheme colorScheme) {
    return TextStyle(
      fontFamily: bodyFont,
      fontFamilyFallback: const [fallbackBodyFont],
      fontSize: 16,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
      height: 1.3,
      color: colorScheme.onSurface,
    );
  }

  /// Reading list name text
  static TextStyle readingListName(ColorScheme colorScheme) {
    return TextStyle(
      fontFamily: bodyFont,
      fontFamilyFallback: const [fallbackBodyFont],
      fontSize: 18,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
      height: 1.33,
      color: colorScheme.onSurface,
    );
  }

  /// Settings title text
  static TextStyle settingsTitle(ColorScheme colorScheme) {
    return TextStyle(
      fontFamily: bodyFont,
      fontFamilyFallback: const [fallbackBodyFont],
      fontSize: 20,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.15,
      height: 1.3,
      color: colorScheme.onSurface,
    );
  }

  /// App version text
  static TextStyle appVersion(ColorScheme colorScheme) {
    return TextStyle(
      fontFamily: uiFont,
      fontFamilyFallback: const [fallbackUiFont],
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4,
      height: 1.33,
      color: colorScheme.onSurfaceVariant.withOpacity(0.6),
    );
  }
}
