import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/router/app_router.dart';
import '../../core/utils/constants.dart';
import '../../services/recommendation_service.dart';

/// Shows progress while the [image] is analysed, then auto-advances.
///
/// The screen kicks off the (mock) analysis on first build and, once it
/// completes, replaces itself with the results screen — so navigating back from
/// results returns to the upload screen rather than re-triggering the analysis.
class LoadingScreen extends StatefulWidget {
  /// Creates the loading screen for the given [image].
  const LoadingScreen({
    required this.image,
    this.service = const MockRecommendationService(),
    super.key,
  });

  /// The image being analysed.
  final XFile image;

  /// The service that produces the recommendation.
  final RecommendationService service;

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    _run();
  }

  Future<void> _run() async {
    final recommendation = await widget.service.analyze(widget.image);
    if (!mounted) return;
    context.pushReplacementNamed(
      AppRouter.resultsName,
      extra: recommendation,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: AppSpacing.lg),
              Text(
                'Analyzing your photo…',
                style: theme.textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                'Mixing the perfect palette.',
                style: theme.textTheme.bodyMedium?.copyWith(
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
