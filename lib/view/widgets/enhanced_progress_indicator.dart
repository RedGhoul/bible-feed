import 'package:flutter/material.dart';

import '../_build_context_extension.dart';
import '../_spacing.dart';

/// Enhanced progress indicator with rounded ends and better styling
///
/// Provides a more polished appearance than the default LinearProgressIndicator
/// with customizable height, colors, and rounded corners.
class EnhancedProgressIndicator extends StatelessWidget {
  /// Progress value from 0.0 to 1.0
  final double progress;

  /// Height of the progress bar (default: 6px)
  final double height;

  /// Optional background color (defaults to theme surface color)
  final Color? backgroundColor;

  /// Optional progress color (defaults to theme primary color)
  final Color? progressColor;

  /// Border radius (default: full rounded)
  final BorderRadius? borderRadius;

  const EnhancedProgressIndicator({
    super.key,
    required this.progress,
    this.height = 6.0,
    this.backgroundColor,
    this.progressColor,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = backgroundColor ?? context.colorScheme.surfaceContainerHighest;
    final fgColor = progressColor ?? context.colorScheme.primary;
    final radius = borderRadius ?? BorderRadius.circular(AppSpacing.radiusFull);

    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: radius,
        color: bgColor,
      ),
      child: ClipRRect(
        borderRadius: radius,
        child: LinearProgressIndicator(
          value: progress,
          backgroundColor: Colors.transparent,
          valueColor: AlwaysStoppedAnimation<Color>(fgColor),
        ),
      ),
    );
  }
}

/// Thin variant of the enhanced progress indicator (4px height)
class ThinProgressIndicator extends StatelessWidget {
  final double progress;
  final Color? backgroundColor;
  final Color? progressColor;

  const ThinProgressIndicator({
    super.key,
    required this.progress,
    this.backgroundColor,
    this.progressColor,
  });

  @override
  Widget build(BuildContext context) {
    return EnhancedProgressIndicator(
      progress: progress,
      height: 4.0,
      backgroundColor: backgroundColor,
      progressColor: progressColor,
    );
  }
}

/// Thick variant of the enhanced progress indicator (8px height)
class ThickProgressIndicator extends StatelessWidget {
  final double progress;
  final Color? backgroundColor;
  final Color? progressColor;

  const ThickProgressIndicator({
    super.key,
    required this.progress,
    this.backgroundColor,
    this.progressColor,
  });

  @override
  Widget build(BuildContext context) {
    return EnhancedProgressIndicator(
      progress: progress,
      height: 8.0,
      backgroundColor: backgroundColor,
      progressColor: progressColor,
    );
  }
}
