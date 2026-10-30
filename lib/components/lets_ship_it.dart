import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:ramiobaid_portfolio/components/app_button.dart';
import 'package:ramiobaid_portfolio/components/section_eyebrow.dart';
import 'package:ramiobaid_portfolio/constants/assets.dart';
import 'package:ramiobaid_portfolio/constants/personal_data.dart';

/// The "Let's Ship It" / Contact showcase section.
/// Fully responsive: 2-column on desktop, optimized stack on tablet/mobile.
class LetsShipIt extends StatelessComponent {
  const LetsShipIt({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'contact', classes: 'lets-ship-it', [
      // 1. Decorative background circle for mobile
      div(classes: 'lsi-bg-circle', []),

      // 2. Main Title Column (Left on Desktop, Top on Mobile)
      div(classes: 'lsi-main-container', [
        // Desktop Eyebrow with square and line
        div(classes: 'lsi-eyebrow--desktop', [
          const SectionEyebrow(
            text: "LET'S WORK TOGETHER",
            color: EyebrowColor.dark,
          ),
        ]),

        // Mobile Eyebrow (clean blue text: HAVE AN IDEA?)
        p(classes: 'lsi-eyebrow--mobile', [
          Component.text('HAVE AN IDEA?'),
        ]),

        // Huge Hero Title: LET'S \n SHIP IT
        h2(classes: 'text-bold-title lsi-title', [
          span(classes: 'lsi-title__line', [Component.text("LET'S")]),
          span(classes: 'lsi-title__line', [
            span(classes: 'lsi-ship', [Component.text('SHIP ')]),
            span(classes: 'title-accent', [Component.text('IT')]),
          ]),
        ]),
      ]),

      // 3. Contact Column (Right on Desktop, Bottom on Mobile)
      div(classes: 'lsi-contact-container', [
        // Paper plane illustration
        img(
          classes: 'lsi-plane',
          src: AppAssets.paperAirplane,
          alt: 'Paper airplane illustration',
        ),

        // Description text
        p(classes: 'lsi-desc text-body-lg', [
          Component.text(
            "Have a project, opportunity, or just want to talk about building products? I’d love to hear from you.",
          ),
        ]),

        // Let's Talk CTA button
        AppButton(
          label: "LET'S TALK",
          href: PersonalData.email,
          icon: AppAssets.mailIcon,
          variant: ButtonVariant.contact,
        ),
      ]),
    ]);
  }
}
