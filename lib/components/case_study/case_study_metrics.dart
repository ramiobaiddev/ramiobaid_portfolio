import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:ramiobaid_portfolio/models/case_study.dart';

class CaseStudyMetrics extends StatelessComponent {
  final CaseStudyData data;

  const CaseStudyMetrics({required this.data, super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'cs-hero__stripe', [
      div(classes: 'cs-hero__stripe-inner', [
        div(classes: 'cs-stripe-item', [
          h3(classes: 'cs-stripe-num', [Component.text('100+')]),
          p(classes: 'cs-stripe-label', [Component.text('Downloaded')]),
        ]),
        div(classes: 'cs-stripe-item', [
          h3(classes: 'cs-stripe-num', [Component.text('5.0 ★')]),
          p(classes: 'cs-stripe-label', [Component.text('Average Rating')]),
        ]),
      ]),
    ]);
  }
}
