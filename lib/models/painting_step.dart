/// A single, ordered instruction in a painting recommendation.
///
/// Steps are intended to be followed in ascending [order]. Instances are
/// immutable and compare by value.
class PaintingStep {
  /// Creates a painting step.
  const PaintingStep({
    required this.order,
    required this.title,
    required this.description,
  });

  /// The 1-based position of this step within the overall sequence.
  final int order;

  /// A short heading for the step (for example, "Block in the shadows").
  final String title;

  /// A fuller explanation of what to do during this step.
  final String description;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PaintingStep &&
          runtimeType == other.runtimeType &&
          order == other.order &&
          title == other.title &&
          description == other.description;

  @override
  int get hashCode => Object.hash(order, title, description);

  @override
  String toString() =>
      'PaintingStep(order: $order, title: $title, description: $description)';
}
