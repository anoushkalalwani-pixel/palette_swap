/// A recipe for mixing a target colour from palette components.
///
/// The [parts] map associates each contributing colour name (matching a
/// [PaletteColor.name] on the recommended palette) with its relative number of
/// parts. Ratios are relative, not absolute: `{ 'Titanium White': 3,
/// 'Ultramarine Blue': 1 }` means three parts white to one part blue.
/// Instances are immutable and compare by value.
class MixingRatio {
  /// Creates a mixing ratio for a named [result] colour.
  const MixingRatio({
    required this.result,
    required this.parts,
  });

  /// The name of the colour produced by this mix (for example, "Sky Blue").
  final String result;

  /// The relative parts of each component colour, keyed by colour name.
  ///
  /// This map is expected to be treated as immutable by callers.
  final Map<String, int> parts;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MixingRatio &&
          runtimeType == other.runtimeType &&
          result == other.result &&
          _mapEquals(parts, other.parts);

  @override
  int get hashCode => Object.hash(
        result,
        Object.hashAllUnordered(
          parts.entries.map((e) => Object.hash(e.key, e.value)),
        ),
      );

  @override
  String toString() => 'MixingRatio(result: $result, parts: $parts)';
}

/// Order-independent equality for two `Map<String, int>` instances.
bool _mapEquals(Map<String, int> a, Map<String, int> b) {
  if (identical(a, b)) return true;
  if (a.length != b.length) return false;
  for (final entry in a.entries) {
    if (!b.containsKey(entry.key) || b[entry.key] != entry.value) return false;
  }
  return true;
}
