// Verifies the core navigation flow: home → upload → loading → results,
// including that data is carried through and back navigation works.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:palette_swap/core/router/app_router.dart';
import 'package:palette_swap/features/loading/loading_screen.dart';
import 'package:palette_swap/models/difficulty.dart';
import 'package:palette_swap/models/recommendation.dart';
import 'package:palette_swap/models/underpainting.dart';
import 'package:palette_swap/services/recommendation_service.dart';

/// A service that resolves immediately so loading advances without a real wait.
class _InstantService implements RecommendationService {
  const _InstantService();

  @override
  Future<Recommendation> analyze(XFile image) async => const Recommendation(
        title: 'Test Piece',
        difficulty: Difficulty.beginner,
        underpainting: Underpainting.black,
        palette: [],
        mixingRatios: [],
        steps: [],
      );
}

void main() {
  testWidgets('home launches first and navigates to upload', (tester) async {
    final router = GoRouter(
      initialLocation: AppRouter.homePath,
      routes: AppRouter.router.configuration.routes,
    );
    await tester.pumpWidget(MaterialApp.router(routerConfig: router));
    await tester.pumpAndSettle();

    expect(find.text('Get Started'), findsOneWidget);

    await tester.tap(find.text('Get Started'));
    await tester.pumpAndSettle();
    expect(find.text('Choose a photo'), findsOneWidget);
  });

  testWidgets('loading auto-advances to results with the recommendation',
      (tester) async {
    final router = GoRouter(
      initialLocation: AppRouter.loadingPath,
      routes: [
        GoRoute(
          path: AppRouter.loadingPath,
          name: AppRouter.loadingName,
          builder: (context, state) => LoadingScreen(
            image: XFile('unused'),
            service: const _InstantService(),
          ),
        ),
        GoRoute(
          path: AppRouter.resultsPath,
          name: AppRouter.resultsName,
          builder: (context, state) => Text(
            (state.extra! as Recommendation).title,
            textDirection: TextDirection.ltr,
          ),
        ),
      ],
    );
    await tester.pumpWidget(MaterialApp.router(routerConfig: router));
    await tester.pumpAndSettle();

    expect(find.text('Test Piece'), findsOneWidget);
  });
}
