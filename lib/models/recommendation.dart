import 'difficulty.dart';
import 'mixing_ratio.dart';
import 'painting_step.dart';
import 'palette_color.dart';
import 'underpainting.dart';

/// A complete painting recommendation produced for a source image.
///
/// Aggregates everything the results screen needs to present: the recommended
/// [palette], how to [mixingRatios] mix its secondary colours, the ordered
/// [steps] to follow, and the overall [difficulty] and [underpainting] choices.
/// Instances are immutable and compare by value.
class Recommendation {
  /// Creates a painting recommendation.
  const Recommendation({
    required this.title,
    required this.difficulty,
    required this.underpainting,
    required this.palette,
    required this.mixingRatios,
    required this.steps,
  });

  /// A short, human-readable name for the recommendation.
  final String title;

  /// The overall skill level the recommendation assumes.
  final Difficulty difficulty;

  /// The monochrome ground the painting should be built upon.
  final Underpainting underpainting;

  /// The recommended palette of purchasable colours.
  final List<PaletteColor> palette;

  /// Recipes for mixing colours from the [palette] components.
  final List<MixingRatio> mixingRatios;

  /// The ordered steps to follow, ascending by [PaintingStep.order].
  final List<PaintingStep> steps;
}
