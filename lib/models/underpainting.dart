/// The monochrome ground a painting is built upon before colour is applied.
///
/// The choice of underpainting influences the mood and value structure of the
/// finished work: a [black] ground reads cooler and higher-contrast, while a
/// [burntUmber] ground gives a warmer, more traditional foundation.
enum Underpainting {
  /// A neutral black ground, favoured for dramatic, high-contrast subjects.
  black,

  /// A warm brown ground (burnt umber), the classic Old Master imprimatura.
  burntUmber;

  /// A short, human-readable label suitable for display in the UI.
  String get label => switch (this) {
        Underpainting.black => 'Black',
        Underpainting.burntUmber => 'Burnt Umber',
      };
}
