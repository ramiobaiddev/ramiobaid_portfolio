import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:ramiobaid_portfolio/components/app_button.dart';
import 'package:ramiobaid_portfolio/constants/assets.dart';

class HeroSection extends StatelessComponent {
  const HeroSection({super.key});

  @override
  Component build(BuildContext context) {
    return section(classes: 'hero', [
      div(classes: 'hero-marquee-track', [
        div(classes: 'hero-marquee-content', [
          span(classes: 'hero-marquee-text', [Component.text('FLUTTER')]),
          span(classes: 'hero-marquee-star', [Component.text('✦')]),
          span(classes: 'hero-marquee-text', [Component.text('FIGMA TO CODE')]),
          span(classes: 'hero-marquee-star', [Component.text('✦')]),
          span(classes: 'hero-marquee-text', [Component.text('MOBILE ARCHITECT')]),
          span(classes: 'hero-marquee-star', [Component.text('✦')]),
          span(classes: 'hero-marquee-text', [Component.text('SHIPPED APPS')]),
          span(classes: 'hero-marquee-star', [Component.text('✦')]),
          // Duplicate for seamless 100% infinite scroll loop
          span(classes: 'hero-marquee-text', [Component.text('FLUTTER')]),
          span(classes: 'hero-marquee-star', [Component.text('✦')]),
          span(classes: 'hero-marquee-text', [Component.text('FIGMA TO CODE')]),
          span(classes: 'hero-marquee-star', [Component.text('✦')]),
          span(classes: 'hero-marquee-text', [Component.text('MOBILE ARCHITECT')]),
          span(classes: 'hero-marquee-star', [Component.text('✦')]),
          span(classes: 'hero-marquee-text', [Component.text('SHIPPED APPS')]),
          span(classes: 'hero-marquee-star', [Component.text('✦')]),
        ]),
      ]),
      div(classes: 'hero-blob-container', [
        div(classes: 'hero-blob-glow', []),
        div(classes: 'hero-blob-ring', []),
        div(classes: 'hero-blob-shape', []),
      ]),
      div(classes: 'hero-content', [
        p(classes: 'eyebrow', [
          Component.text('FIGMA → FLUTTER → GOOGLE PLAY'),
        ]),
        h2(classes: 'text-h3 greeting', [Component.text("Hi, I'm")]),
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
            href: '#',
            variant: ButtonVariant.secondary,
            icon: AppAssets.downloadIcon,
          ),
        ]),
      ]),
      div(classes: 'hero-visual', [
        img(src: AppAssets.portrait, alt: 'Rami sitting in a chair'),
      ]),
    ]);
  }
}
