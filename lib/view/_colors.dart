import 'package:flutter/material.dart';

/// Application color system with semantic naming and biblical inspiration
///
/// Provides a cohesive color palette that evokes spirituality, wisdom, and trust
/// while maintaining excellent readability and accessibility.
class AppColors {
  AppColors._();

  // ============================================================================
  // SEED COLORS
  // ============================================================================

  /// Primary seed color - Reverent Blue
  ///
  /// Inspired by sacred art, stained glass, and illuminated manuscripts.
  /// Evokes trust, wisdom, and spirituality.
  static const Color seedColor = Color(0xff2962ff);

  /// Secondary seed color - Purple accent
  ///
  /// Complements the primary blue while adding depth and richness.
  static const Color secondarySeed = Color(0xff7c4dff);

  /// Tertiary seed color - Gold/Amber
  ///
  /// Used for highlights and accents, evoking sacred gold leaf and illumination.
  static const Color tertiarySeed = Color(0xffd4af37);

  // ============================================================================
  // STATE COLORS
  // ============================================================================

  /// Color for completed/read feeds
  static const Color readFeedColor = Color(0xff4caf50);

  /// Color for pending/unread feeds
  static const Color unreadFeedColor = Color(0xff2962ff);

  /// Color for progress indicators
  static const Color progressColor = Color(0xffffab40);

  // ============================================================================
  // SEMANTIC COLORS
  // ============================================================================

  /// Success state color (green)
  static const Color successColor = Color(0xff4caf50);

  /// Warning state color (orange)
  static const Color warningColor = Color(0xffff9800);

  /// Error state color (red)
  static const Color errorColor = Color(0xfff44336);

  // ============================================================================
  // SURFACE COLORS (Context-aware)
  // ============================================================================

  /// Elevated surface color
  static Color surfaceElevated(BuildContext context) =>
      Theme.of(context).colorScheme.surfaceContainerHigh;

  /// Highest surface level
  static Color surfaceHighest(BuildContext context) =>
      Theme.of(context).colorScheme.surfaceContainerHighest;

  /// Low surface level
  static Color surfaceLow(BuildContext context) =>
      Theme.of(context).colorScheme.surfaceContainerLow;

  /// Lowest surface level
  static Color surfaceLowest(BuildContext context) =>
      Theme.of(context).colorScheme.surfaceContainerLowest;

  // ============================================================================
  // TEXT COLORS (Context-aware)
  // ============================================================================

  /// Primary text color (highest emphasis)
  static Color textPrimary(BuildContext context) =>
      Theme.of(context).colorScheme.onSurface;

  /// Secondary text color (medium emphasis)
  static Color textSecondary(BuildContext context) =>
      Theme.of(context).colorScheme.onSurfaceVariant;

  /// Tertiary text color (low emphasis)
  static Color textTertiary(BuildContext context) =>
      Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(0.6);

  /// Disabled text color
  static Color textDisabled(BuildContext context) =>
      Theme.of(context).colorScheme.onSurface.withOpacity(0.38);

  // ============================================================================
  // OLED DARK MODE COLORS
  // ============================================================================

  /// True black for OLED screens
  static const Color oledBlack = Color(0xff000000);

  /// Dark surface variant for OLED
  static const Color oledSurfaceContainer = Color(0xff0a0a0a);

  /// Dark surface low for OLED
  static const Color oledSurfaceContainerLow = Color(0xff050505);

  /// Dark surface high for OLED
  static const Color oledSurfaceContainerHigh = Color(0xff1a1a1a);

  /// Dark surface highest for OLED
  static const Color oledSurfaceContainerHighest = Color(0xff2a2a2a);
}
