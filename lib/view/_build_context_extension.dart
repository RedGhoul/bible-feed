import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:watch_it/watch_it.dart';

import '../service/haptic_service.dart';
import '_colors.dart';
import '_constants.dart';
import '_typography.dart';

extension BuildContextExtension<T> on BuildContext {
  // ============================================================================
  // DEVICE PROPERTIES
  // ============================================================================

  MediaQueryData get mediaQuery => MediaQuery.of(this);
  double get deviceTextScale => mediaQuery.textScaler.scale(1); // from device settings
  bool get isDarkMode => mediaQuery.platformBrightness == Brightness.dark;
  bool get isOrientationLandscape => mediaQuery.orientation == Orientation.landscape;
  bool get isOrientationPortrait => mediaQuery.orientation == Orientation.portrait;

  // ============================================================================
  // THEME PROPERTIES
  // ============================================================================

  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => theme.colorScheme;
  double get defaultFontSize => DefaultTextStyle.of(this).style.fontSize ?? Constants.defaultFontSize;
  TextTheme get textTheme => theme.textTheme;

  // ============================================================================
  // DESIGN SYSTEM SHORTCUTS
  // ============================================================================

  // Color shortcuts
  Color get surfaceElevated => AppColors.surfaceElevated(this);
  Color get surfaceHighest => AppColors.surfaceHighest(this);
  Color get surfaceLow => AppColors.surfaceLow(this);
  Color get surfaceLowest => AppColors.surfaceLowest(this);
  Color get textPrimary => AppColors.textPrimary(this);
  Color get textSecondary => AppColors.textSecondary(this);
  Color get textTertiary => AppColors.textTertiary(this);
  Color get textDisabled => AppColors.textDisabled(this);

  // Typography shortcuts
  TextStyle get bookChapterLarge => AppTypography.bookChapterLarge(colorScheme);
  TextStyle get bookChapterMedium => AppTypography.bookChapterMedium(colorScheme);
  TextStyle get listWheelText => AppTypography.listWheelText(colorScheme);
  TextStyle get listWheelTextCompact => AppTypography.listWheelTextCompact(colorScheme);
  TextStyle get readingListName => AppTypography.readingListName(colorScheme);
  TextStyle get settingsTitle => AppTypography.settingsTitle(colorScheme);
  TextStyle get appVersion => AppTypography.appVersion(colorScheme);

  // ============================================================================
  // NAVIGATION
  // ============================================================================

  void navigateTo(Widget page) => Navigator.of(this).push(MaterialPageRoute(builder: (_) => page));

  // ============================================================================
  // DIALOGS
  // ============================================================================

  Future<T?> showDialogWithBlurBackground(Widget child) {
    sl<HapticService>().impact();
    const blurSigma = 3.0;
    return showDialog(
      context: this,
      // ignore: no-equal-arguments, x and y must be equal
      builder: (_) => BackdropFilter(filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma), child: child),
    );
  }
}
