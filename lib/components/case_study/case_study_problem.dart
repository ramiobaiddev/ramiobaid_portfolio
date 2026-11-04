import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:ramiobaid_portfolio/components/case_study/case_study_eyebrow.dart';
import 'package:ramiobaid_portfolio/components/section_eyebrow.dart';
import 'package:ramiobaid_portfolio/models/case_study.dart';

class CaseStudyProblem extends StatelessComponent {
  final CaseStudyProblemData data;

  const CaseStudyProblem({required this.data, super.key});

  @override
  Component build(BuildContext context) {
    return section(classes: 'cs-problem', [
      div(classes: 'cs-problem__inner', [
        div(classes: 'cs-problem__title-col', [
          CaseStudyEyebrow(color: EyebrowColor.blue, text: data.eyebrow),
          h2(classes: 'text-role-title  cs-problem__heading', [
            Component.text(data.title),
          ]),
        ]),
        div(classes: 'cs-problem__desc-col', [
          div(classes: 'border-line', []),
          p(classes: 'text-body-lg cs-problem__desc', [
            Component.text(data.description),
          ]),
        ]),
      ]),
    ]);
  }
}
