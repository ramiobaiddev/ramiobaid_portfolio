import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:ramiobaid_portfolio/components/app_button.dart';
import 'package:ramiobaid_portfolio/constants/assets.dart';

class HeroSection extends StatelessComponent {
  const HeroSection({super.key});

  @override
  Component build(BuildContext context) {
    return section(classes: 'hero', [
      div(classes: 'hero-content', [
        p(classes: 'eyebrow', [
          Component.text('FIGMA → FLUTTER → GOOGLE PLAY'),
        ]),
        p(classes: 'text-h3 greeting', [Component.text("Hi, I'm")]),
        h1(classes: 'text-role-title name', [Component.text('Rami Obaid')]),
        p(classes: 'text-h3 role', [Component.text('Mobile Developer')]),
        p(classes: 'text-body-lg hero-description', [
          Component.text(
            'I design mobile experiences in Figma and build '
            'them in Flutter—from the first concept to a '
            'shipped app.',
          ),
        ]),
        div(classes: 'hero-actions', [
          AppButton(
            label: 'View My Apps',
            href: '#projects',
            variant: ButtonVariant.primary,
            icon: AppAssets.arrowForward,
          ),
          AppButton(
            label: 'Download CV',
            href: AppAssets.cv,
            target: '_blank',
            download: 'Rami_Obaid_CV.pdf',
            variant: ButtonVariant.secondary,
            icon: AppAssets.downloadIcon,
          ),
        ]),
      ]),
      div(classes: 'hero-visual', [
        img(
          src: AppAssets.portrait,
          alt: 'Rami sitting in a chair',
          width: 1102,
          height: 1008,
          loading: MediaLoading.eager,
          attributes: {
            'fetchpriority': 'high',
          },
        ),
      ]),
    ]);
  }
}
