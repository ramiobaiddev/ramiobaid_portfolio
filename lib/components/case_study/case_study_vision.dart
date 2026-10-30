import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:ramiobaid_portfolio/components/case_study/case_study_eyebrow.dart';
import 'package:ramiobaid_portfolio/components/section_eyebrow.dart';
import 'package:ramiobaid_portfolio/models/case_study.dart';

class CaseStudyVision extends StatelessComponent {
  final CaseStudyVisionData data;

  const CaseStudyVision({required this.data, super.key});

  @override
  Component build(BuildContext context) {
    return section(classes: 'cs-vision', [
      div(classes: 'cs-vision__inner', [
        CaseStudyEyebrow(color: EyebrowColor.blue, text: data.eyebrow),
        h2(classes: 'text-x-large-title cs-vision__heading', [
          Component.text(data.title),
        ]),
        p(classes: 'text-body-lg cs-vision__desc', [
          Component.text(data.description),
        ]),

        if (data.pillars.isNotEmpty)
          div(classes: 'cs-vision__pillars', [
            for (final pillar in data.pillars)
              div(classes: 'cs-pillar-card', [
                h3(classes: 'cs-pillar-title', [Component.text(pillar.title)]),
                p(
                  classes: 'cs-pillar-desc',
                  [Component.text(pillar.description)],
                ),
              ]),
          ]),
      ]),
    ]);
  }
}
