import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

/// Available color themes for the section eyebrow title.
enum EyebrowColor {
  /// Primary blue (e.g., Projects section)
  blue,

  /// Accent yellow / orange (e.g., About Me section over dark gradient)
  yellow,

  /// Dark navy / charcoal (e.g., Contact / Let's Ship It section)
  dark,
  white,
}

/// A reusable section eyebrow component with an uppercase label,
/// an accent square, and a fluid horizontal line.
class SectionEyebrow extends StatelessComponent {
  final String text;
  final EyebrowColor color;

  const SectionEyebrow({
    required this.text,
    this.color = EyebrowColor.blue,
    super.key,
  });

  String get _colorClass {
    switch (color) {
      case EyebrowColor.blue:
        return 'section-eyebrow--blue';
      case EyebrowColor.yellow:
        return 'section-eyebrow--yellow';
      case EyebrowColor.dark:
        return 'section-eyebrow--dark';
      case EyebrowColor.white:
        return 'section-eyebrow--white';
    }
  }

  @override
  Component build(BuildContext context) {
    return p(classes: 'section-eyebrow $_colorClass', [
      span(classes: 'section-eyebrow__text', [Component.text(text)]),
      span(classes: 'section-eyebrow__square', []),
      span(classes: 'section-eyebrow__line', []),
    ]);
  }
}
