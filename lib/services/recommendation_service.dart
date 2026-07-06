import 'package:image_picker/image_picker.dart';

import '../models/difficulty.dart';
import '../models/mixing_ratio.dart';
import '../models/painting_step.dart';
import '../models/palette_color.dart';
import '../models/recommendation.dart';
import '../models/underpainting.dart';

/// Produces a [Recommendation] for a source image.
///
/// This is the seam the real analysis engine will eventually sit behind. The
/// current implementation is a mock: it ignores the pixels and returns a fixed,
/// hand-authored recommendation after a short delay so the loading flow behaves
/// as it will in production.
abstract interface class RecommendationService {
  /// Analyses [image] and resolves with a painting recommendation.
  Future<Recommendation> analyze(XFile image);
}

/// A stand-in [RecommendationService] that returns canned data.
///
/// Used while the analysis engine is being built so the rest of the app —
/// navigation, loading, and results presentation — can be developed and tested
/// end to end.
class MockRecommendationService implements RecommendationService {
  /// Creates a mock service.
  ///
  /// [delay] simulates the latency of a real analysis so the loading screen has
  /// something meaningful to wait on.
  const MockRecommendationService({
    this.delay = const Duration(seconds: 2),
  });

  /// How long [analyze] waits before resolving.
  final Duration delay;

  @override
  Future<Recommendation> analyze(XFile image) async {
    await Future<void>.delayed(delay);
    return _sample;
  }

  /// A representative recommendation used for every mock analysis.
  static const Recommendation _sample = Recommendation(
    title: 'Golden Hour Landscape',
    difficulty: Difficulty.intermediate,
    underpainting: Underpainting.burntUmber,
    palette: [
      PaletteColor(
        name: 'Titanium White',
        hex: '#F4F2E9',
        winsorNewtonPigment: 'Titanium White',
      ),
      PaletteColor(
        name: 'Yellow Ochre',
        hex: '#C4964B',
        winsorNewtonPigment: 'Yellow Ochre',
      ),
      PaletteColor(
        name: 'Cadmium Red',
        hex: '#B22222',
        winsorNewtonPigment: 'Cadmium Red Deep',
      ),
      PaletteColor(
        name: 'Ultramarine Blue',
        hex: '#274690',
        winsorNewtonPigment: 'French Ultramarine',
      ),
      PaletteColor(
        name: 'Burnt Umber',
        hex: '#4A342A',
        winsorNewtonPigment: 'Burnt Umber',
      ),
    ],
    mixingRatios: [
      MixingRatio(
        result: 'Warm Sky',
        parts: {'Titanium White': 4, 'Yellow Ochre': 1, 'Cadmium Red': 1},
      ),
      MixingRatio(
        result: 'Shadow Violet',
        parts: {'Ultramarine Blue': 2, 'Cadmium Red': 1, 'Burnt Umber': 1},
      ),
    ],
    steps: [
      PaintingStep(
        order: 1,
        title: 'Tone the ground',
        description:
            'Lay a thin burnt umber imprimatura and wipe back the lights.',
      ),
      PaintingStep(
        order: 2,
        title: 'Block in the values',
        description:
            'Establish the darkest darks and lightest lights before colour.',
      ),
      PaintingStep(
        order: 3,
        title: 'Develop the colour',
        description:
            'Work from the palette, mixing secondaries with the ratios above.',
      ),
    ],
  );
}
