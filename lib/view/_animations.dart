import 'package:flutter/material.dart';

/// Application animation system with durations, curves, and common patterns
///
/// Provides consistent animation timings and easing curves throughout the app
/// following Material Design motion guidelines.
class AppAnimations {
  AppAnimations._();

  // ============================================================================
  // DURATIONS
  // ============================================================================

  /// Instant transition (100ms) - For immediate feedback
  static const Duration instant = Duration(milliseconds: 100);

  /// Fast transition (200ms) - For small UI changes
  static const Duration fast = Duration(milliseconds: 200);

  /// Medium transition (300ms) - Standard animations
  static const Duration medium = Duration(milliseconds: 300);

  /// Slow transition (500ms) - For larger movements
  static const Duration slow = Duration(milliseconds: 500);

  /// Very slow transition (800ms) - For dramatic effects
  static const Duration verySlow = Duration(milliseconds: 800);

  /// Fade out duration (2 seconds) - For subtle fade effects
  static const Duration fadeOut = Duration(seconds: 2);

  /// Long fade out (30 seconds) - For gradual state changes
  static const Duration longFadeOut = Duration(seconds: 30);

  // ============================================================================
  // EASING CURVES
  // ============================================================================

  /// Default curve for most animations
  static const Curve defaultCurve = Curves.easeInOutCubic;

  /// Emphasized curve for important actions (Material 3)
  static const Curve emphasized = Curves.easeInOutCubicEmphasized;

  /// Emphasized decelerate (Material 3) - For enter animations
  static const Curve emphasizedDecelerate = Curves.easeOutCubic;

  /// Emphasized accelerate (Material 3) - For exit animations
  static const Curve emphasizedAccelerate = Curves.easeInCubic;

  /// Bounce curve for playful effects
  static const Curve bounce = Curves.elasticOut;

  /// Spring curve for natural motion
  static const Curve spring = Curves.easeOutBack;

  /// Linear curve (no easing)
  static const Curve linear = Curves.linear;

  // ============================================================================
  // SCALE ANIMATIONS
  // ============================================================================

  /// Scale down value for tap feedback (95%)
  static const double tapScaleDown = 0.95;

  /// Scale up value for emphasis (105%)
  static const double scaleUp = 1.05;

  /// No scale (100%)
  static const double noScale = 1.0;

  /// Fully scaled down (0%)
  static const double scaleZero = 0.0;

  // ============================================================================
  // OPACITY VALUES
  // ============================================================================

  /// Fully visible
  static const double opacityFull = 1.0;

  /// Slightly transparent (87%)
  static const double opacityHigh = 0.87;

  /// Medium transparency (60%)
  static const double opacityMedium = 0.6;

  /// Low opacity (38%)
  static const double opacityLow = 0.38;

  /// Disabled state (25%)
  static const double opacityDisabled = 0.25;

  /// Invisible
  static const double opacityZero = 0.0;

  // ============================================================================
  // STAGGER DELAYS
  // ============================================================================

  /// Delay between staggered items (50ms)
  static const Duration staggerDelay = Duration(milliseconds: 50);

  /// Short stagger delay (25ms)
  static const Duration staggerDelayShort = Duration(milliseconds: 25);

  /// Long stagger delay (100ms)
  static const Duration staggerDelayLong = Duration(milliseconds: 100);

  // ============================================================================
  // COMMON ANIMATION PATTERNS
  // ============================================================================

  /// Fade in animation
  static Animation<double> fadeIn(AnimationController controller) {
    return Tween<double>(
      begin: opacityZero,
      end: opacityFull,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: emphasizedDecelerate,
    ));
  }

  /// Fade out animation
  static Animation<double> fadeOut(AnimationController controller) {
    return Tween<double>(
      begin: opacityFull,
      end: opacityZero,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: emphasizedAccelerate,
    ));
  }

  /// Scale up animation (from 0 to 1)
  static Animation<double> scaleIn(AnimationController controller) {
    return Tween<double>(
      begin: scaleZero,
      end: noScale,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: emphasizedDecelerate,
    ));
  }

  /// Scale down animation (from 1 to 0)
  static Animation<double> scaleOut(AnimationController controller) {
    return Tween<double>(
      begin: noScale,
      end: scaleZero,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: emphasizedAccelerate,
    ));
  }

  /// Slide up animation
  static Animation<Offset> slideUp(AnimationController controller) {
    return Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: emphasizedDecelerate,
    ));
  }

  /// Slide down animation
  static Animation<Offset> slideDown(AnimationController controller) {
    return Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0, 0.1),
    ).animate(CurvedAnimation(
      parent: controller,
      curve: emphasizedAccelerate,
    ));
  }

  // ============================================================================
  // HELPER METHODS
  // ============================================================================

  /// Calculate stagger delay for item at index
  static Duration staggerDelayFor(int index, {Duration? baseDelay}) {
    final delay = baseDelay ?? staggerDelay;
    return Duration(milliseconds: delay.inMilliseconds * index);
  }

  /// Create a tween animation with default curve
  static Animation<T> createTween<T>({
    required AnimationController controller,
    required T begin,
    required T end,
    Curve? curve,
  }) {
    return Tween<T>(begin: begin, end: end).animate(
      CurvedAnimation(
        parent: controller,
        curve: curve ?? defaultCurve,
      ),
    );
  }
}
