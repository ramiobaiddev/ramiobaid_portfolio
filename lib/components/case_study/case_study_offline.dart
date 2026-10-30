import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:ramiobaid_portfolio/models/case_study.dart';

class CaseStudyOffline extends StatelessComponent {
  final CaseStudyOfflineData data;

  const CaseStudyOffline({required this.data, super.key});

  @override
  Component build(BuildContext context) {
    return section(classes: 'cs-offline', [
      div(classes: 'cs-offline__inner', [
        // 1. Top Section Eyebrow (e.g. 03 / OFFLINE FAVORITES)
        p(classes: 'cs-offline__top-eyebrow', [
          Component.text(data.eyebrow),
        ]),

        // 2. Main Two-Column Body
        div(classes: 'cs-offline__main', [
          // Left: Single Mockup Phone + Caption
          div(classes: 'cs-offline__mockup-col', [
            if (data.mockups.isNotEmpty)
              img(
                classes: 'cs-offline__phone-img',
                src: data.mockups.first,
                alt: 'Favorites Screen Mockup',
              ),
            p(classes: 'cs-offline__phone-label', [
              Component.text(data.mockupLabel),
            ]),
          ]),

          // Right: Content + Flow Steps
          div(classes: 'cs-offline__content-col', [
            h2(classes: 'text-bold-title cs-offline__title', [
              Component.text(data.title),
            ]),
            p(classes: 'text-body-lg cs-offline__desc', [
              Component.text(data.description),
            ]),
            if (data.secondaryDescription != null &&
                data.secondaryDescription!.isNotEmpty)
              p(classes: 'text-body-lg cs-offline__desc', [
                Component.text(data.secondaryDescription!),
              ]),

            // OFFLINE-FIRST FLOW
            if (data.flowSteps.isNotEmpty) ...[
              p(classes: 'cs-offline__flow-eyebrow', [
                Component.text(data.flowEyebrow),
              ]),
              div(classes: 'cs-offline__flow-grid', [
                for (final step in data.flowSteps)
                  div(classes: 'cs-offline__flow-step', [
                    p(classes: 'cs-offline__step-num', [
                      Component.text(step.step),
                    ]),
                    h4(classes: 'cs-offline__step-label', [
                      Component.text(step.title),
                    ]),
                  ]),
              ]),
            ],
          ]),
        ]),

        // 3. Full-width separator line
        div(classes: 'cs-offline__divider', []),

        // 4. Bottom Tech Stack Bar
        if (data.techBadges.isNotEmpty)
          div(classes: 'cs-offline__tech-row', [
            span(classes: 'cs-offline__tech-label', [
              Component.text('Tech Stack'),
            ]),
            div(classes: 'cs-offline__tech-box', [
              for (final badge in data.techBadges)
                img(
                  classes: 'cs-offline__tech-icon',
                  src: badge,
                  alt: 'Tech Stack Icon',
                ),
            ]),
          ]),
      ]),
    ]);
  }
}
