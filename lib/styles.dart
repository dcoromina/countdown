import 'package:flutter/material.dart';

/// Convenience class to access application colors.
abstract class AppColors {
  /// Dark background color.
  static const Color backgroundColor = Colors.blueGrey;

  /// Slightly lighter version of [backgroundColor].
  static const Color backgroundFadedColor = Color(0xFF191B1C);

  /// Color used for cards and surfaces.
  static const Color cardColor = Color(0xFF1F2426);

  /// Accent color used in the application.
  static const Color accentColor = Color(0xFFef8354);
}
