import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:ramiobaid_portfolio/components/case_study/case_study_eyebrow.dart';
import 'package:ramiobaid_portfolio/components/section_eyebrow.dart';
import 'package:ramiobaid_portfolio/models/case_study.dart';

class CaseStudyWireframes extends StatelessComponent {
  final CaseStudyWireframesData data;

  const CaseStudyWireframes({required this.data, super.key});

  @override
  Component build(BuildContext context) {
    return section(classes: 'cs-wireframes', [
      div(classes: 'cs-wireframes__inner', [
        CaseStudyEyebrow(color: EyebrowColor.blue, text: data.eyebrow),
        h2(classes: 'text-h1 cs-wireframes__heading', [
          Component.text(data.title),
        ]),
        p(classes: 'text-body-lg cs-wireframes__desc', [
          Component.text(data.description),
        ]),

        div(classes: 'cs-wireframes__grid', [
          for (final wf in data.wireframes)
            div(classes: 'cs-wireframe-item', [
              img(
                classes: 'cs-wireframe-img',
                src: wf,
                alt: 'Wireframe Screen',
                attributes: {
                  'loading': 'lazy',
                  'decoding': 'async',
                },
              ),
            ]),
        ]),
      ]),
    ]);
  }
}
