import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:ramiobaid_portfolio/components/section_eyebrow.dart';

class CaseStudyEyebrow extends StatelessComponent {
  final EyebrowColor color;
  final String text;

  CaseStudyEyebrow({super.key, required this.color, required this.text});
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
    return p(
      classes: 'section-eyebrow $_colorClass',
      [
        span(classes: 'section-eyebrow__text', [Component.text(text)]),
      ],
    );
  }
}
