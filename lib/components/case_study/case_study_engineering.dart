import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:ramiobaid_portfolio/models/case_study.dart';

class CaseStudyEngineering extends StatelessComponent {
  final CaseStudyEngineeringData data;

  const CaseStudyEngineering({required this.data, super.key});

  @override
  Component build(BuildContext context) {
    return section(classes: 'cs-engineering', [
      div(classes: 'cs-engineering__inner', [
        // 1. Huge Section Title at top
        h2(classes: 'text-bold-title cs-engineering__heading', [
          Component.text(data.title),
        ]),

        // 2. Two-Column Body (Story on Left, Stack on Right)
        div(classes: 'cs-engineering__body', [
          // Left Column
          div(classes: 'cs-engineering__content', [
            p(classes: 'cs-engineering__eyebrow', [
              Component.text(data.eyebrow),
            ]),
            h3(classes: 'text-h1 cs-engineering__subtitle', [
              Component.text(data.subtitle),
            ]),
            p(classes: 'text-body-lg cs-engineering__desc', [
              Component.text(data.description),
            ]),
          ]),

          // Right Column: Clean Architecture Stack
          div(classes: 'cs-engineering__stack', [
            for (var i = 0; i < data.layers.length; i++)
              div(
                classes: 'cs-engineering__layer cs-engineering__layer--${i + 1}',
                [
                  span(classes: 'cs-engineering__layer-badge', [
                    Component.text(data.layers[i].badge),
                  ]),
                  h4(classes: 'cs-engineering__layer-title', [
                    Component.text(data.layers[i].title),
                  ]),
                ],
              ),
          ]),
        ]),
      ]),
    ]);
  }
}
