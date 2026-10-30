import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:ramiobaid_portfolio/components/section_eyebrow.dart';
import 'package:ramiobaid_portfolio/constants/assets.dart';

class AboutMe extends StatelessComponent {
  const AboutMe({super.key});

  @override
  Component build(BuildContext context) {
    return section(classes: 'about-me', [
      div(classes: 'about-me-content', [
        div(classes: 'about-me-header', [
          const SectionEyebrow(
            text: 'ABOUT ME',
            color: EyebrowColor.yellow,
          ),

          h2(classes: 'text-h1 about-me-title', [
            span([Component.text('Who’s behind')]),
            span(classes: 'title-accent', [Component.text('the code?')]),
          ]),
        ]),

        div(classes: 'text-paragraph-lg-bold about-me-description', [
          p([
            Component.text(
              "I’m Rami, an independent Flutter developer working at the intersection of UI/UX, engineering, and product thinking.",
            ),
          ]),
          p([
            Component.text(
              "I bring design and development together, shaping mobile experiences in Figma before building them in Flutter.",
            ),
          ]),
        ]),
      ]),
      img(classes: 'about-me__image', src: AppAssets.aboutSectionImage, alt: "Rami Obaid smiling"),
    ]);
  }
}
