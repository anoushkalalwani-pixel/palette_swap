import 'package:flutter/material.dart';

import '../utils/constants.dart';

/// Centralised Material 3 theme for the application.
///
/// The design language is clean and minimalist, aimed at traditional artists:
/// a warm, gallery-neutral palette derived from a single burnt-sienna seed
/// (evoking the burnt-umber underpainting the app recommends), generous
/// whitespace, low elevation, and quiet, legible typography.
///
/// Light appearance is the primary, fully-tuned theme. The structure is built
/// around [_buildTheme], which takes a [ColorScheme] — so a dark theme can be
/// added later by deriving a dark scheme from [_seedColor] and passing it in,
/// without touching the component or typography configuration.
abstract final class AppTheme {
  /// The seed colour that drives the Material 3 [ColorScheme].
  ///
  /// A warm terracotta / burnt sienna — a pigment-adjacent hue that reads as
  /// artistic and understated rather than corporate.
  static const Color _seedColor = Color(0xFF9E5C42);

  /// The primary (light) theme used by the root app.
  static ThemeData get light => _buildTheme(
        ColorScheme.fromSeed(
          seedColor: _seedColor,
          brightness: Brightness.light,
        ),
      );

  /// Builds a [ThemeData] from the given [colorScheme].
  ///
  /// All brightness-independent styling (typography, shapes, spacing, component
  /// themes) lives here so light and future dark themes stay in lock-step.
  static ThemeData _buildTheme(ColorScheme colorScheme) {
    final textTheme = _buildTextTheme(colorScheme);

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.surface,
      textTheme: textTheme,
      // A subtle top divider replaces the default hairline where used.
      dividerTheme: DividerThemeData(
        color: colorScheme.outlineVariant,
        thickness: 1,
        space: AppSpacing.lg,
      ),
      appBarTheme: _appBarTheme(colorScheme, textTheme),
      cardTheme: _cardTheme(colorScheme),
      elevatedButtonTheme: _elevatedButtonTheme(),
      filledButtonTheme: _filledButtonTheme(),
      outlinedButtonTheme: _outlinedButtonTheme(colorScheme),
      textButtonTheme: _textButtonTheme(),
      inputDecorationTheme: _inputDecorationTheme(colorScheme),
      chipTheme: _chipTheme(colorScheme),
    );
  }

  // ---------------------------------------------------------------------------
  // Typography
  // ---------------------------------------------------------------------------

  /// Builds the typography scale.
  ///
  /// Starts from the Material 3 baseline and tightens display/headline weights
  /// and letter-spacing for a refined, editorial feel suited to a gallery-like
  /// aesthetic. Colours are left to the framework so the scheme's `onSurface`
  /// tones apply automatically.
  static TextTheme _buildTextTheme(ColorScheme colorScheme) {
    const base = Typography.englishLike2021;
    return base.copyWith(
      displayLarge: base.displayLarge?.copyWith(
        fontWeight: FontWeight.w600,
        letterSpacing: -0.5,
      ),
      displayMedium: base.displayMedium?.copyWith(
        fontWeight: FontWeight.w600,
        letterSpacing: -0.5,
      ),
      displaySmall: base.displaySmall?.copyWith(fontWeight: FontWeight.w600),
      headlineLarge: base.headlineLarge?.copyWith(fontWeight: FontWeight.w600),
      headlineMedium:
          base.headlineMedium?.copyWith(fontWeight: FontWeight.w600),
      headlineSmall: base.headlineSmall?.copyWith(fontWeight: FontWeight.w600),
      titleLarge: base.titleLarge?.copyWith(fontWeight: FontWeight.w600),
      labelLarge: base.labelLarge?.copyWith(
        fontWeight: FontWeight.w600,
        letterSpacing: 0.1,
      ),
    ).apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    );
  }

  // ---------------------------------------------------------------------------
  // Component themes
  // ---------------------------------------------------------------------------

  static AppBarTheme _appBarTheme(ColorScheme colorScheme, TextTheme text) {
    return AppBarTheme(
      centerTitle: false,
      elevation: AppElevation.none,
      scrolledUnderElevation: AppElevation.low,
      backgroundColor: colorScheme.surface,
      foregroundColor: colorScheme.onSurface,
      surfaceTintColor: colorScheme.surfaceTint,
      titleTextStyle: text.titleLarge,
    );
  }

  static CardThemeData _cardTheme(ColorScheme colorScheme) {
    return CardThemeData(
      elevation: AppElevation.none,
      color: colorScheme.surfaceContainerLow,
      surfaceTintColor: Colors.transparent,
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: AppBorderRadius.lg,
        side: BorderSide(color: colorScheme.outlineVariant),
      ),
    );
  }

  /// Shared visual density and shape for all button variants.
  static ButtonStyle _baseButtonStyle() {
    return ButtonStyle(
      minimumSize: const WidgetStatePropertyAll(Size(0, 52)),
      padding: const WidgetStatePropertyAll(
        EdgeInsets.symmetric(horizontal: AppSpacing.lg),
      ),
      shape: const WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: AppBorderRadius.md),
      ),
    );
  }

  static ElevatedButtonThemeData _elevatedButtonTheme() {
    return ElevatedButtonThemeData(
      style: _baseButtonStyle().merge(
        const ButtonStyle(elevation: WidgetStatePropertyAll(AppElevation.low)),
      ),
    );
  }

  static FilledButtonThemeData _filledButtonTheme() {
    return FilledButtonThemeData(style: _baseButtonStyle());
  }

  static OutlinedButtonThemeData _outlinedButtonTheme(ColorScheme colorScheme) {
    return OutlinedButtonThemeData(
      style: _baseButtonStyle().merge(
        ButtonStyle(
          side: WidgetStatePropertyAll(
            BorderSide(color: colorScheme.outline),
          ),
        ),
      ),
    );
  }

  static TextButtonThemeData _textButtonTheme() {
    return TextButtonThemeData(
      style: ButtonStyle(
        minimumSize: const WidgetStatePropertyAll(Size(0, 44)),
        padding: const WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: AppSpacing.md),
        ),
        shape: const WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: AppBorderRadius.sm),
        ),
      ),
    );
  }

  static InputDecorationTheme _inputDecorationTheme(ColorScheme colorScheme) {
    final border = OutlineInputBorder(
      borderRadius: AppBorderRadius.md,
      borderSide: BorderSide(color: colorScheme.outlineVariant),
    );
    return InputDecorationTheme(
      filled: true,
      fillColor: colorScheme.surfaceContainerLowest,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      border: border,
      enabledBorder: border,
      focusedBorder: OutlineInputBorder(
        borderRadius: AppBorderRadius.md,
        borderSide: BorderSide(color: colorScheme.primary, width: 2),
      ),
    );
  }

  static ChipThemeData _chipTheme(ColorScheme colorScheme) {
    return ChipThemeData(
      backgroundColor: colorScheme.surfaceContainerHigh,
      side: BorderSide(color: colorScheme.outlineVariant),
      shape: const RoundedRectangleBorder(borderRadius: AppBorderRadius.sm),
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xxs,
      ),
    );
  }
}
