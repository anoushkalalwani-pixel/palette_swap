import 'package:flutter/material.dart';

import '../../core/utils/constants.dart';

/// The landing screen of the application.
///
/// This is a baseline placeholder introduced with the initial project
/// structure; the upload flow will be wired in by a later task.
class HomeScreen extends StatelessWidget {
  /// Creates the home screen.
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Palette Swap')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Palette Swap',
                style: textTheme.displaySmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                'AI-assisted palettes for traditional oil painters.',
                style: textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
