import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:ramiobaid_portfolio/constants/assets.dart';
import 'package:ramiobaid_portfolio/constants/personal_data.dart';

/// The portfolio Footer component.
/// Supports both Desktop 3-column layout with yellow accent divider and
/// Mobile stacked layout with dedicated dividers and touch targets.
class Footer extends StatelessComponent {
  const Footer({super.key});

  @override
  Component build(BuildContext context) {
    return footer(classes: 'site-footer', [
      div(classes: 'footer-content', [
        // 1. Top Logo Bar
        div(classes: 'footer-brand', [
          a(href: '#', classes: 'footer-logo', [
            img(
              src: AppAssets.rLogo,
              alt: 'Rami Obaid Logo',
              width: 44,
              height: 44,
            ),
          ]),
        ]),

        // 2. Full-width line under logo
        div(classes: 'footer-divider footer-divider--top', []),

        // 3. Huge Name Title: "Rami Obaid"
        h2(classes: 'text-bold-title footer-name', [
          Component.text('Rami Obaid'),
        ]),

        // 4. Desktop-only multi-segment divider above columns
        div(classes: 'footer-columns-divider', [
          div(classes: 'footer-col-divider footer-col-divider--links', []),
          div(classes: 'footer-col-divider footer-col-divider--connect', []),
          div(classes: 'footer-col-divider footer-col-divider--info', []),
        ]),

        // 5. Columns Container (Desktop 3-column / Mobile vertical stack)
        div(classes: 'footer-columns', [
          // Column 1: Quick Links
          div(classes: 'footer-column footer-column--links', [
            h4(classes: 'footer-col-title', [Component.text('QUICK LINKS')]),
            nav(classes: 'footer-nav', [
              a(href: '#', [Component.text('Home')]),
              a(href: '#projects', [Component.text('Projects')]),
              a(href: '#about', [Component.text('About me')]),
            ]),
          ]),

          // Mobile divider before connect (Yellow accent)
          div(
            classes: 'footer-divider footer-divider--accent footer-divider--mobile-only',
            [],
          ),

          // Column 2: Connect (Social Links)
          div(classes: 'footer-column footer-column--connect', [
            h4(classes: 'footer-col-title', [Component.text('CONNECT')]),
            div(classes: 'footer-socials', [
              a(
                href: PersonalData.facebook,
                target: Target.blank,
                classes: 'footer-social-link',
                [img(src: AppAssets.facebook, alt: 'Facebook')],
              ),
              a(
                href: PersonalData.linkedin,
                target: Target.blank,
                classes: 'footer-social-link',
                [img(src: AppAssets.linkedin, alt: 'LinkedIn')],
              ),
              a(
                href: PersonalData.instagram,
                target: Target.blank,
                classes: 'footer-social-link',
                [img(src: AppAssets.instagram, alt: 'Instagram')],
              ),
              a(
                href: PersonalData.github,
                target: Target.blank,
                classes: 'footer-social-link',
                [img(src: AppAssets.github, alt: 'GitHub')],
              ),
            ]),
          ]),

          // Mobile divider before info
          div(classes: 'footer-divider footer-divider--mobile-only', []),

          // Column 3: Info
          div(classes: 'footer-column footer-column--info', [
            h4(classes: 'footer-col-title', [Component.text('INFO')]),
            div(classes: 'footer-info-list', [
              a(
                href: PersonalData.email,
                classes: 'footer-info-link',
                [Component.text(PersonalData.emailDisplay)],
              ),
              a(
                href: PersonalData.phoneHref,
                classes: 'footer-info-link',
                [Component.text(PersonalData.phoneNumber)],
              ),
              p(classes: 'footer-info-item', [
                Component.text(PersonalData.location),
              ]),
            ]),
          ]),
        ]),

        // 6. Bottom divider line
        div(classes: 'footer-divider footer-divider--bottom', []),
      ]),
    ]);
  }
}
