import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:ramiobaid_portfolio/components/case_study/case_study_eyebrow.dart';
import 'package:ramiobaid_portfolio/components/section_eyebrow.dart';
import 'package:ramiobaid_portfolio/models/case_study.dart';

class CaseStudyChallenges extends StatelessComponent {
  final CaseStudyChallengesData data;

  const CaseStudyChallenges({required this.data, super.key});

  @override
  Component build(BuildContext context) {
    return section(classes: 'cs-challenges', [
      div(classes: 'cs-challenges__inner', [
        CaseStudyEyebrow(color: EyebrowColor.blue, text: data.eyebrow),
        h2(classes: 'text-role-title cs-challenges__heading', [
          Component.text(data.title),
        ]),
        p(classes: 'text-body-lg cs-challenges__desc', [
          Component.text(data.description),
        ]),

        div(classes: 'cs-challenges__grid', [
          for (final card in data.cards)
            div(classes: 'cs-challenge-card', [
              div(classes: 'cs-challenge-card__bar', []),
              h3(classes: 'cs-challenge-metric', [Component.text(card.metric)]),
              h4(classes: 'cs-challenge-label', [Component.text(card.label)]),
              p(classes: 'cs-challenge-desc', [Component.text(card.description)]),
            ]),
        ]),
      ]),
    ]);
  }
}
