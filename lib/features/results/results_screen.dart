import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/router/app_router.dart';
import '../../core/utils/constants.dart';
import '../../models/palette_color.dart';
import '../../models/recommendation.dart';

/// Presents the [recommendation] produced for the user's photo.
///
/// A baseline presentation of the recommendation data (palette, difficulty, and
/// steps); a later task fleshes out the full results experience.
class ResultsScreen extends StatelessWidget {
  /// Creates the results screen for the given [recommendation].
  const ResultsScreen({required this.recommendation, super.key});

  /// The recommendation to display.
  final Recommendation recommendation;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Your palette')),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        children: [
          Text(recommendation.title, style: theme.textTheme.headlineSmall),
          const SizedBox(height: AppSpacing.xs),
          Text(
            '${recommendation.difficulty.label} · '
            '${recommendation.underpainting.label} ground',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text('Palette', style: theme.textTheme.titleMedium),
          const SizedBox(height: AppSpacing.sm),
          for (final color in recommendation.palette) _PaletteRow(color: color),
          const SizedBox(height: AppSpacing.lg),
          Text('Steps', style: theme.textTheme.titleMedium),
          const SizedBox(height: AppSpacing.sm),
          for (final step in recommendation.steps)
            Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.sm),
              child: Text('${step.order}. ${step.title}'),
            ),
          const SizedBox(height: AppSpacing.lg),
          FilledButton(
            onPressed: () => context.goNamed(AppRouter.homeName),
            child: const Text('Start over'),
          ),
        ],
      ),
    );
  }
}

/// A single swatch-and-label row for a [PaletteColor].
class _PaletteRow extends StatelessWidget {
  const _PaletteRow({required this.color});

  final PaletteColor color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Row(
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: _parseHex(color.hex),
              borderRadius: AppBorderRadius.sm,
              border: Border.all(color: theme.colorScheme.outlineVariant),
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Text(
              color.name,
              style: theme.textTheme.bodyLarge,
            ),
          ),
          Text(
            color.winsorNewtonPigment,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  /// Parses a `#RRGGBB` string into an opaque [Color].
  static Color _parseHex(String hex) {
    final value = int.parse(hex.substring(1), radix: 16);
    return Color(0xFF000000 | value);
  }
}
