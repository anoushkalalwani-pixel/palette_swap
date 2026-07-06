import 'package:flutter/material.dart';

/// Centralised theme definitions for the application.
///
/// A single seed colour drives both the light and dark [ColorScheme]s so the
/// palette stays consistent across brightness modes.
abstract final class AppTheme {
  /// The seed colour used to derive the Material 3 colour schemes.
  static const Color _seedColor = Color(0xFF3E5C76);

  /// The theme used when the platform requests a light appearance.
  static ThemeData get light => _themeFor(Brightness.light);

  /// The theme used when the platform requests a dark appearance.
  static ThemeData get dark => _themeFor(Brightness.dark);

  static ThemeData _themeFor(Brightness brightness) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: _seedColor,
      brightness: brightness,
    );
    return ThemeData(
      colorScheme: colorScheme,
      useMaterial3: true,
    );
  }
}
