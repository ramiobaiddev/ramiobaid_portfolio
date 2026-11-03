import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:ramiobaid_portfolio/components/case_study/case_study_eyebrow.dart';
import 'package:ramiobaid_portfolio/components/section_eyebrow.dart';
import 'package:ramiobaid_portfolio/models/case_study.dart';

class CaseStudyGallery extends StatelessComponent {
  final CaseStudyGalleryData data;

  const CaseStudyGallery({required this.data, super.key});

  @override
  Component build(BuildContext context) {
    return section(classes: 'cs-gallery', [
      div(classes: 'cs-gallery__inner', [
        CaseStudyEyebrow(color: EyebrowColor.blue, text: data.eyebrow),
        h2(classes: 'text-h1 cs-gallery__heading', [
          Component.text(data.title),
          span(classes: 'title-accent cs-gallery__accent', [
            Component.text(' ${data.accentTitle}'),
          ]),
        ]),

        for (final category in data.categories)
          div(classes: 'cs-gallery-category', [
            h3(classes: 'cs-gallery-cat-title', [
              Component.text(category.title),
            ]),
            div(classes: 'cs-gallery-grid', [
              for (final screen in category.screenshots)
                div(classes: 'cs-gallery-item', [
                  img(
                    classes: 'cs-gallery-img',
                    src: screen,
                    alt: '${category.title} Screen',
                    attributes: {
                      'loading': 'lazy',
                      'decoding': 'async',
                    },
                  ),
                ]),
            ]),
          ]),
      ]),
    ]);
  }
}
