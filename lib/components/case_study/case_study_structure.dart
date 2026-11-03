import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:ramiobaid_portfolio/components/case_study/case_study_eyebrow.dart';
import 'package:ramiobaid_portfolio/components/section_eyebrow.dart';
import 'package:ramiobaid_portfolio/models/case_study.dart';

class CaseStudyStructure extends StatelessComponent {
  final CaseStudyStructureData data;

  const CaseStudyStructure({required this.data, super.key});

  @override
  Component build(BuildContext context) {
    return section(classes: 'cs-structure', [
      div(classes: 'cs-structure__inner', [
        CaseStudyEyebrow(color: EyebrowColor.dark, text: data.eyebrow),
        h2(classes: 'text-bold-title cs-structure__heading', [
          Component.text(data.title),
        ]),
        h3(classes: 'text-h2 cs-structure__subtitle', [
          Component.text(data.subtitle),
        ]),
        p(classes: 'text-body-lg cs-structure__desc', [
          Component.text(data.description),
        ]),

        div(classes: 'cs-structure__diagram-card', [
          img(
            classes: 'cs-structure__diagram-img',
            src: data.diagramImage,
            alt: '${data.title} Information Architecture Diagram',
            attributes: {
              'loading': 'lazy',
              'decoding': 'async',
            },
          ),
        ]),
      ]),
    ]);
  }
}
