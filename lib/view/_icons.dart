import 'package:flutter/material.dart';

import '_spacing.dart';

/// Application icon system with consistent sizing and semantic names
///
/// Provides a centralized location for all icons used in the app,
/// ensuring consistency and making icon updates easier.
class AppIcons {
  AppIcons._();

  // ============================================================================
  // ICON SIZES
  // ============================================================================

  /// Small icon size (20px)
  static const double small = AppSpacing.iconSmall;

  /// Medium icon size (24px) - Default Material icon size
  static const double medium = AppSpacing.iconMedium;

  /// Large icon size (32px) - App bar icons
  static const double large = AppSpacing.iconLarge;

  /// Extra large icon size (48px) - Hero icons
  static const double xl = AppSpacing.iconXL;

  // ============================================================================
  // NAVIGATION & ACTIONS
  // ============================================================================

  /// Settings icon (outlined variant for modern look)
  static const IconData settings = Icons.settings_outlined;

  /// Share icon (Android)
  static const IconData share = Icons.share_outlined;

  /// Share icon (iOS)
  static const IconData iosShare = Icons.ios_share;

  /// Back/close icon
  static const IconData close = Icons.close;

  /// Expand more
  static const IconData expandMore = Icons.unfold_more;

  /// Expand less
  static const IconData expandLess = Icons.unfold_less;

  // ============================================================================
  // BIBLE & READING
  // ============================================================================

  /// Open bible book icon
  static const IconData bibleOpen = Icons.menu_book_outlined;

  /// Closed bible book icon
  static const IconData bibleClosed = Icons.book_outlined;

  /// Currently reading indicator
  static const IconData currentReading = Icons.auto_stories;

  /// Chapter icon
  static const IconData chapter = Icons.bookmark_outline;

  // ============================================================================
  // STATE & STATUS
  // ============================================================================

  /// Success / Completed icon
  static const IconData success = Icons.check_circle;

  /// Success outlined
  static const IconData successOutlined = Icons.check_circle_outline;

  /// Checkmark (simple)
  static const IconData check = Icons.check;

  /// Done / Complete action
  static const IconData done = Icons.done;

  /// Warning icon
  static const IconData warning = Icons.warning_amber;

  /// Warning outlined
  static const IconData warningOutlined = Icons.warning_amber_outlined;

  /// Error icon
  static const IconData error = Icons.error_outline;

  /// Info icon
  static const IconData info = Icons.info_outline;

  // ============================================================================
  // BIBLE READER
  // ============================================================================

  /// Bible reader enabled
  static const IconData readerEnabled = Icons.auto_stories;

  /// Bible reader disabled
  static const IconData readerDisabled = Icons.visibility_off;

  /// Link icon
  static const IconData link = Icons.link;

  /// Unlink icon
  static const IconData unlink = Icons.link_off;

  // ============================================================================
  // SETTINGS & PREFERENCES
  // ============================================================================

  /// Toggle on
  static const IconData toggleOn = Icons.toggle_on;

  /// Toggle off
  static const IconData toggleOff = Icons.toggle_off;

  /// Brightness (for theme switching)
  static const IconData brightness = Icons.brightness_6;

  /// Dark mode
  static const IconData darkMode = Icons.dark_mode_outlined;

  /// Light mode
  static const IconData lightMode = Icons.light_mode_outlined;

  /// Haptic/vibration
  static const IconData haptic = Icons.vibration;

  // ============================================================================
  // PROGRESS & TIME
  // ============================================================================

  /// Calendar/Date
  static const IconData calendar = Icons.calendar_today_outlined;

  /// Time/Clock
  static const IconData time = Icons.schedule_outlined;

  /// Progress indicator
  static const IconData progress = Icons.trending_up;

  /// History
  static const IconData history = Icons.history;

  // ============================================================================
  // HELPER METHODS
  // ============================================================================

  /// Get the appropriate share icon based on platform
  static IconData getShareIcon(bool isAndroid) {
    return isAndroid ? share : iosShare;
  }

  /// Get state icon based on completion status
  static IconData getStateIcon(bool isCompleted) {
    return isCompleted ? success : successOutlined;
  }

  /// Get bible reader icon based on enabled status
  static IconData getBibleReaderIcon(bool isEnabled) {
    return isEnabled ? readerEnabled : readerDisabled;
  }
}
