import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:ramiobaid_portfolio/components/app_button.dart';
import 'package:ramiobaid_portfolio/components/header.dart';
import 'package:ramiobaid_portfolio/constants/assets.dart';
import 'package:ramiobaid_portfolio/models/case_study.dart';

class CaseStudyHero extends StatelessComponent {
  final CaseStudyHeroData data;

  const CaseStudyHero({required this.data, super.key});

  @override
  Component build(BuildContext context) {
    return section(classes: 'cs-hero', [
      // 1. Integrated Header at top of blue hero
      const Header(),

      // 2. Main Hero Body Container
      div(classes: 'cs-hero__container', [
        div(classes: 'cs-hero__body', [
          // Left: Info, Tech Stack & CTAs
          div(classes: 'cs-hero__info', [
            // App Title (MOVIFY)
            h1(classes: 'text-bold-title cs-hero__title', [
              Component.text(data.title),
            ]),

            // Subtitle Heading (A place to discover movies & TV.)
            h2(classes: 'text-h3 cs-hero__tagline-heading', [
              Component.text(data.subtitle),
            ]),

            // Description Paragraph
            if (data.description.isNotEmpty)
              p(classes: 'text-paragraph-lg cs-hero__desc', [
                Component.text(data.description),
              ]),

            // Dark Accent Bar
            div(classes: 'cs-hero__accent-bar', []),

            // Tech Stack Icons (Figma, Flutter, TMDB, Firebase)
            if (data.techStack.isNotEmpty)
              div(classes: 'cs-hero__tech-stack', [
                for (final icon in data.techStack)
                  img(
                    classes: 'cs-hero__tech-icon',
                    src: icon,
                    alt: 'Tech stack icon',
                  ),
              ]),

            // CTAs
            div(classes: 'cs-hero__actions', [
              if (data.googlePlayUrl != null)
                AppButton(
                  label: 'GOOGLE PLAY',
                  href: data.googlePlayUrl!,
                  variant: ButtonVariant.primary,
                  icon: AppAssets.googlePlayColored,
                ),
              if (data.githubUrl != null)
                AppButton(
                  label: 'GITHUB',
                  href: data.githubUrl!,
                  variant: ButtonVariant.secondary,
                  icon: AppAssets.github,
                ),
            ]),
          ]),

          // Right: Dual mockups image
          div(classes: 'cs-hero__mockup-wrapper', [
            img(
              classes: 'cs-hero__mockup-img',
              src: data.mockupImage,
              alt: '${data.title} Mockups',
            ),
          ]),
        ]),
      ]),

      // Bottom Dark Metrics Stripe
    ]);
  }
}
