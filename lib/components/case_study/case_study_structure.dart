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
        h3(classes: 'text-h3 cs-structure__subtitle', [
          Component.text(data.subtitle),
        ]),
        p(classes: 'text-body-lg cs-structure__desc', [
          Component.text(data.description),
        ]),

        div(
          classes: 'cs-structure__diagram-card',
          attributes: {
            'onclick': "document.getElementById('ia-diagram-lightbox')?.classList.add('is-open'); document.body.style.overflow='hidden';",
            'role': 'button',
            'tabindex': '0',
            'aria-label': 'Click to open diagram in fullscreen lightbox',
          },
          [
            img(
              classes: 'cs-structure__diagram-img',
              src: data.diagramImage,
              alt: '${data.title} Information Architecture Diagram',
              attributes: {
                'loading': 'lazy',
                'decoding': 'async',
              },
            ),
            div(classes: 'cs-structure__zoom-hint', [
              span([Component.text('🔍 Tap to expand')]),
            ]),
          ],
        ),

        div(
          id: 'ia-diagram-lightbox',
          classes: 'cs-lightbox',
          attributes: {
            'onclick': "if (event.target === this || event.target.closest('.cs-lightbox__close')) { this.classList.remove('is-open'); document.body.style.overflow=''; }",
          },
          [
            button(
              classes: 'cs-lightbox__close',
              attributes: {
                'type': 'button',
                'aria-label': 'Close lightbox',
              },
              [Component.text('✕')],
            ),
            div(classes: 'cs-lightbox__scroll', [
              img(
                classes: 'cs-lightbox__img',
                src: data.diagramImage,
                alt: '${data.title} Information Architecture Diagram Fullscreen',
              ),
            ]),
          ],
        ),
      ]),
    ]);
  }
}
