import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:ramiobaid_portfolio/components/case_study/case_study_eyebrow.dart';
import 'package:ramiobaid_portfolio/components/section_eyebrow.dart';
import 'package:ramiobaid_portfolio/models/case_study.dart';

class CaseStudyVisual extends StatelessComponent {
  final CaseStudyVisualData data;

  const CaseStudyVisual({required this.data, super.key});

  @override
  Component build(BuildContext context) {
    return section(classes: 'cs-visual', [
      div(classes: 'cs-visual__inner', [
        // Top Spotlight row
        div(classes: 'cs-visual__spotlight', [
          // div(classes: 'cs-visual__spotlight-mockup', [
          //   img(
          //     classes: 'cs-visual__spotlight-img',
          //     src: data.spotlightMockup,
          //     alt: 'Spotlight UI Mockup',
          //   ),
          // ]),
          div(classes: 'cs-visual__spotlight-text', [
            CaseStudyEyebrow(color: EyebrowColor.white, text: data.eyebrow),
            h2(classes: 'text-h1 cs-visual__heading', [
              Component.text(data.title),
            ]),
            p(classes: 'text-body-lg cs-visual__desc', [
              Component.text(data.description),
            ]),
          ]),
        ]),

        // Bottom Screen Showcase Grid
        if (data.showcaseScreens.isNotEmpty)
          div(classes: 'cs-visual__showcase-grid', [
            for (final screen in data.showcaseScreens)
              div(classes: 'cs-visual-screen-card', [
                img(
                  classes: 'cs-visual-screen-img',
                  src: screen,
                  alt: 'UI Showcase Screen',
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
