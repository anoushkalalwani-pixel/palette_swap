/// The overall skill level required to complete a painting recommendation.
///
/// Ordered from least to most demanding so the values can be compared by
/// [Enum.index] when a relative ranking is needed.
enum Difficulty {
  /// Approachable for someone new to oil painting.
  beginner,

  /// Assumes comfort with colour mixing and basic technique.
  intermediate,

  /// Requires confident brushwork and colour theory.
  advanced;

  /// A short, human-readable label suitable for display in the UI.
  String get label => switch (this) {
        Difficulty.beginner => 'Beginner',
        Difficulty.intermediate => 'Intermediate',
        Difficulty.advanced => 'Advanced',
      };
}
