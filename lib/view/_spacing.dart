import 'package:flutter/material.dart';

/// Application spacing and sizing system based on 8-point grid
///
/// Provides a comprehensive spacing scale and common patterns to ensure
/// consistent rhythm and visual hierarchy throughout the application.
class AppSpacing {
  AppSpacing._();

  // ============================================================================
  // BASE UNIT
  // ============================================================================

  /// Base spacing unit (8px)
  ///
  /// All spacing values are multiples or fractions of this base unit.
  static const double unit = 8.0;

  // ============================================================================
  // SPACING SCALE
  // ============================================================================

  /// Extra extra small spacing (4px)
  static const double xxs = unit * 0.5;

  /// Extra small spacing (8px)
  static const double xs = unit;

  /// Small spacing (12px)
  static const double sm = unit * 1.5;

  /// Medium spacing (16px)
  static const double md = unit * 2;

  /// Large spacing (24px)
  static const double lg = unit * 3;

  /// Extra large spacing (32px)
  static const double xl = unit * 4;

  /// Extra extra large spacing (48px)
  static const double xxl = unit * 6;

  // ============================================================================
  // PADDING PRESETS
  // ============================================================================

  /// Extra small padding (8px all around)
  static const EdgeInsets paddingXS = EdgeInsets.all(xs);

  /// Small padding (12px all around)
  static const EdgeInsets paddingSM = EdgeInsets.all(sm);

  /// Medium padding (16px all around)
  static const EdgeInsets paddingMD = EdgeInsets.all(md);

  /// Large padding (24px all around)
  static const EdgeInsets paddingLG = EdgeInsets.all(lg);

  /// Extra large padding (32px all around)
  static const EdgeInsets paddingXL = EdgeInsets.all(xl);

  // ============================================================================
  // COMMON PADDING PATTERNS
  // ============================================================================

  /// Standard card padding (16px)
  static const EdgeInsets cardPadding = EdgeInsets.all(md);

  /// Dialog content padding (24px)
  static const EdgeInsets dialogPadding = EdgeInsets.all(lg);

  /// Screen edge padding (16px)
  static const EdgeInsets screenPadding = EdgeInsets.all(md);

  /// List item padding (16px horizontal, 12px vertical)
  static const EdgeInsets listItemPadding = EdgeInsets.symmetric(
    horizontal: md,
    vertical: sm,
  );

  /// Button padding (24px horizontal, 12px vertical)
  static const EdgeInsets buttonPadding = EdgeInsets.symmetric(
    horizontal: lg,
    vertical: sm,
  );

  // ============================================================================
  // BORDER RADIUS SCALE
  // ============================================================================

  /// Extra small radius (4px)
  static const double radiusXS = 4.0;

  /// Small radius (8px)
  static const double radiusSM = 8.0;

  /// Medium radius (12px)
  static const double radiusMD = 12.0;

  /// Large radius (16px)
  static const double radiusLG = 16.0;

  /// Extra large radius (24px)
  static const double radiusXL = 24.0;

  /// Full radius (9999px - creates circular shape)
  static const double radiusFull = 9999.0;

  // ============================================================================
  // COMMON BORDER RADIUS
  // ============================================================================

  /// Extra small border radius (4px)
  static const BorderRadius borderRadiusXS = BorderRadius.all(
    Radius.circular(radiusXS),
  );

  /// Small border radius (8px)
  static const BorderRadius borderRadiusSM = BorderRadius.all(
    Radius.circular(radiusSM),
  );

  /// Medium border radius (12px)
  static const BorderRadius borderRadiusMD = BorderRadius.all(
    Radius.circular(radiusMD),
  );

  /// Large border radius (16px)
  static const BorderRadius borderRadiusLG = BorderRadius.all(
    Radius.circular(radiusLG),
  );

  /// Extra large border radius (24px)
  static const BorderRadius borderRadiusXL = BorderRadius.all(
    Radius.circular(radiusXL),
  );

  /// Circular border radius
  static const BorderRadius borderRadiusFull = BorderRadius.all(
    Radius.circular(radiusFull),
  );

  // ============================================================================
  // ICON SIZES
  // ============================================================================

  /// Small icon size (20px)
  static const double iconSmall = 20.0;

  /// Medium icon size (24px)
  static const double iconMedium = 24.0;

  /// Large icon size (32px)
  static const double iconLarge = 32.0;

  /// Extra large icon size (48px)
  static const double iconXL = 48.0;

  // ============================================================================
  // MINIMUM TOUCH TARGETS
  // ============================================================================

  /// Minimum touch target size for accessibility (48px)
  ///
  /// Per Material Design and WCAG guidelines.
  static const double minTouchTarget = 48.0;

  /// Comfortable touch target size (56px)
  static const double comfortableTouchTarget = 56.0;

  // ============================================================================
  // ELEVATION CONSTANTS
  // ============================================================================

  /// No elevation
  static const double elevationNone = 0.0;

  /// Low elevation (1dp)
  static const double elevationLow = 1.0;

  /// Medium elevation (4dp)
  static const double elevationMedium = 4.0;

  /// High elevation (8dp)
  static const double elevationHigh = 8.0;

  /// Very high elevation (12dp)
  static const double elevationVeryHigh = 12.0;

  // ============================================================================
  // HELPER METHODS
  // ============================================================================

  /// Creates symmetric padding with the same horizontal and vertical values
  static EdgeInsets symmetric({double? horizontal, double? vertical}) {
    return EdgeInsets.symmetric(
      horizontal: horizontal ?? 0,
      vertical: vertical ?? 0,
    );
  }

  /// Creates padding with only specific sides
  static EdgeInsets only({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) {
    return EdgeInsets.only(
      left: left,
      top: top,
      right: right,
      bottom: bottom,
    );
  }

  /// Creates a gap (SizedBox) with the specified spacing
  static SizedBox gap(double size) => SizedBox(
        width: size,
        height: size,
      );

  /// Creates a horizontal gap
  static SizedBox gapHorizontal(double width) => SizedBox(width: width);

  /// Creates a vertical gap
  static SizedBox gapVertical(double height) => SizedBox(height: height);
}
