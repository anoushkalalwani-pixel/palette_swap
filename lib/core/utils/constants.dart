/// Design tokens for the application.
///
/// Every screen and component should size, space, and round itself using these
/// constants rather than hard-coded magic numbers. Centralising them keeps the
/// layout rhythm consistent and makes global tuning a one-file change.
///
/// The scales below follow an 8-point grid (with a 4pt half-step) which is the
/// spacing system Material 3 is built around.
library;

import 'package:flutter/widgets.dart';

/// Spacing tokens, in logical pixels, following an 8pt grid.
///
/// Use these for padding, margins, and gaps between elements. The names are
/// t-shirt sizes so intent reads clearly at call sites (for example,
/// `EdgeInsets.all(AppSpacing.lg)`).
abstract final class AppSpacing {
  /// 4pt — hairline gaps, e.g. between a label and its icon.
  static const double xxs = 4;

  /// 8pt — tight spacing inside dense components.
  static const double xs = 8;

  /// 12pt — compact spacing, e.g. between chips.
  static const double sm = 12;

  /// 16pt — the default gutter and content padding.
  static const double md = 16;

  /// 24pt — comfortable separation between distinct blocks.
  static const double lg = 24;

  /// 32pt — section-level breathing room.
  static const double xl = 32;

  /// 48pt — generous, gallery-like whitespace around focal content.
  static const double xxl = 48;
}

/// Corner-radius tokens, in logical pixels.
///
/// Keeping radii on a small, shared scale is what makes buttons, cards, and
/// inputs feel like they belong to one system.
abstract final class AppRadius {
  /// 8pt — subtle rounding for small controls and chips.
  static const double sm = 8;

  /// 12pt — the default radius for buttons and inputs.
  static const double md = 12;

  /// 16pt — cards and larger surfaces.
  static const double lg = 16;

  /// 28pt — pill-shaped elements and prominent containers.
  static const double xl = 28;
}

/// [BorderRadius] presets built from [AppRadius] for direct use in shapes.
abstract final class AppBorderRadius {
  /// A uniformly rounded [BorderRadius] of [AppRadius.sm].
  static const BorderRadius sm = BorderRadius.all(Radius.circular(AppRadius.sm));

  /// A uniformly rounded [BorderRadius] of [AppRadius.md].
  static const BorderRadius md = BorderRadius.all(Radius.circular(AppRadius.md));

  /// A uniformly rounded [BorderRadius] of [AppRadius.lg].
  static const BorderRadius lg = BorderRadius.all(Radius.circular(AppRadius.lg));

  /// A uniformly rounded [BorderRadius] of [AppRadius.xl].
  static const BorderRadius xl = BorderRadius.all(Radius.circular(AppRadius.xl));
}

/// Elevation tokens, in logical pixels.
///
/// The aesthetic is deliberately flat and minimalist, so elevations stay low;
/// separation is carried by spacing and subtle surface tints instead of heavy
/// shadows.
abstract final class AppElevation {
  /// No shadow — flush with the surface.
  static const double none = 0;

  /// A barely-there lift for resting cards.
  static const double low = 1;

  /// A gentle lift for interactive or focused surfaces.
  static const double medium = 3;
}
