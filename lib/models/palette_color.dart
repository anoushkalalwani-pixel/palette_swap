/// A single colour on the recommended palette.
///
/// Each colour is tied to a concrete, purchasable paint via its
/// [winsorNewtonPigment] (a Winsor & Newton pigment name) so the palette can be
/// reproduced faithfully. Instances are immutable and compare by value.
class PaletteColor {
  /// Creates a palette colour.
  ///
  /// All fields are required; there is no meaningful default for a paint.
  const PaletteColor({
    required this.name,
    required this.hex,
    required this.winsorNewtonPigment,
  });

  /// The common display name of the colour (for example, "Titanium White").
  final String name;

  /// The colour as a 6-digit uppercase RGB hex string prefixed with `#`
  /// (for example, `#F4F2E9`).
  final String hex;

  /// The corresponding Winsor & Newton pigment name used to source the paint.
  final String winsorNewtonPigment;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PaletteColor &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          hex == other.hex &&
          winsorNewtonPigment == other.winsorNewtonPigment;

  @override
  int get hashCode => Object.hash(name, hex, winsorNewtonPigment);

  @override
  String toString() =>
      'PaletteColor(name: $name, hex: $hex, winsorNewtonPigment: $winsorNewtonPigment)';
}
