import 'package:flutter/material.dart';

import '_build_context_extension.dart';
import '_spacing.dart';

/// Application elevation system with consistent shadow and depth
///
/// Provides standardized elevation values and shadow generation
/// for creating visual hierarchy and depth.
class AppElevation {
  AppElevation._();

  // ============================================================================
  // ELEVATION LEVELS
  // ============================================================================

  /// No elevation (0dp)
  static const double none = AppSpacing.elevationNone;

  /// Low elevation (1dp) - Subtle lift
  static const double low = AppSpacing.elevationLow;

  /// Medium elevation (4dp) - Standard cards
  static const double medium = AppSpacing.elevationMedium;

  /// High elevation (8dp) - Elevated components
  static const double high = AppSpacing.elevationHigh;

  /// Very high elevation (12dp) - Dialogs, modals
  static const double veryHigh = AppSpacing.elevationVeryHigh;

  // ============================================================================
  // CUSTOM SHADOWS
  // ============================================================================

  /// Generate box shadows for custom elevation
  ///
  /// Creates appropriate shadows based on elevation level and theme brightness.
  /// Higher elevations produce more pronounced shadows.
  static List<BoxShadow> shadow(
    BuildContext context, {
    required double elevation,
  }) {
    if (elevation == none) return [];

    final isDark = context.isDarkMode;
    final baseColor = isDark ? Colors.black : Colors.black54;

    // Different shadow intensity for dark mode
    final opacity = isDark ? 0.3 : 0.15;

    return [
      BoxShadow(
        color: baseColor.withOpacity(opacity),
        blurRadius: elevation * 2,
        offset: Offset(0, elevation / 2),
      ),
    ];
  }

  /// Generate subtle shadow for read/completed items
  static List<BoxShadow> subtleShadow(BuildContext context) {
    final isDark = context.isDarkMode;
    return [
      BoxShadow(
        color: (isDark ? Colors.black : Colors.black54).withOpacity(0.05),
        blurRadius: 2,
        offset: const Offset(0, 1),
      ),
    ];
  }

  /// Generate prominent shadow for current/active items
  static List<BoxShadow> prominentShadow(BuildContext context) {
    return shadow(context, elevation: veryHigh);
  }

  // ============================================================================
  // ELEVATION FOR SPECIFIC COMPONENTS
  // ============================================================================

  /// Elevation for feed cards (based on state)
  static double feedCard({
    required bool isRead,
    required bool isCurrent,
  }) {
    if (isRead) return none;
    if (isCurrent) return veryHigh;
    return medium;
  }

  /// Elevation for dialogs
  static const double dialog = veryHigh;

  /// Elevation for bottom sheets
  static const double bottomSheet = high;

  /// Elevation for app bar
  static const double appBar = low;

  /// Elevation for floating action button
  static const double fab = medium;

  /// Elevation for cards
  static const double card = none; // We use custom shadows instead

  // ============================================================================
  // BORDER ALTERNATIVES
  // ============================================================================

  /// Creates a subtle border for flat components
  ///
  /// Use instead of elevation for read/completed items
  static BoxBorder border(BuildContext context, {Color? color}) {
    return Border.all(
      color: color ?? context.colorScheme.outlineVariant.withOpacity(0.5),
      width: 1,
    );
  }

  /// Creates a prominent border for emphasis
  static BoxBorder borderAccent(BuildContext context) {
    return Border.all(
      color: context.colorScheme.primary.withOpacity(0.3),
      width: 2,
    );
  }
}
