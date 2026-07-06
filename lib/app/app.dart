import 'package:flutter/material.dart';

import '../core/router/app_router.dart';
import '../core/theme/app_theme.dart';

/// The root widget of the Palette Swap application.
///
/// Wires together the theme and the declarative router. Kept intentionally
/// thin: feature composition happens inside the routed screens.
class PaletteSwapApp extends StatelessWidget {
  /// Creates the root application widget.
  const PaletteSwapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Palette Swap',
      theme: AppTheme.light,
      // Dark theme is not enabled yet; [AppTheme] is structured so it can be
      // added by supplying a dark [ColorScheme] to its builder.
      themeMode: ThemeMode.light,
      routerConfig: AppRouter.router,
    );
  }
}
