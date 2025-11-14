import 'package:flutter/material.dart';

import '_spacing.dart';

/// Application constants
///
/// This class maintains backward compatibility while encouraging use of the
/// new design system in _spacing.dart
class Constants {
  Constants._();

  // ============================================================================
  // LEGACY CONSTANTS (Deprecated - use AppSpacing instead)
  // ============================================================================

  /// @deprecated Use AppSpacing.iconLarge instead
  static const appbarIconSize = AppSpacing.iconLarge;

  /// @deprecated Use AppSpacing.paddingXS instead
  static const defaultPadding = AppSpacing.paddingXS;

  /// @deprecated Use AppSpacing.sm instead
  static const defaultSpacing = AppSpacing.sm;

  /// @deprecated Use AppTypography textTheme instead
  static const defaultFontSize = 14.0;

  // ============================================================================
  // APP-SPECIFIC CONSTANTS
  // ============================================================================

  /// Deep link query parameter key
  static const deeplinkQueryKey = 'json';
}
