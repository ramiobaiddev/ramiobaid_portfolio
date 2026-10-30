import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:ramiobaid_portfolio/components/app_button.dart';
import 'package:ramiobaid_portfolio/constants/assets.dart';
import 'package:ramiobaid_portfolio/models/case_study.dart';

class CaseStudyCta extends StatelessComponent {
  final CaseStudyCtaData data;

  const CaseStudyCta({required this.data, super.key});

  @override
  Component build(BuildContext context) {
    return section(classes: 'cs-cta', [
      div(classes: 'cs-cta__inner', [
        if (data.eyebrow != null)
          div(classes: 'cs-cta__eyebrow', [
            Component.text(data.eyebrow!),
          ]),
        h2(classes: 'cs-cta__heading', [
          Component.text(data.title),
        ]),
        div(classes: 'cs-cta__bottom', [
          p(classes: 'cs-cta__subtitle', [
            Component.text(data.subtitle),
          ]),
          div(classes: 'cs-cta__actions', [
            AppButton(
              label: 'Back to projects',
              href: '/#projects',
              variant: ButtonVariant.secondary,
              icon: AppAssets.arrowBack,
              iconLeading: true,
            ),
            if (data.googlePlayUrl != null)
              AppButton(
                label: 'Google Play',
                href: data.googlePlayUrl!,
                variant: ButtonVariant.contact,
                icon: AppAssets.googlePlay,
                iconLeading: true,
              ),
          ]),
        ]),
      ]),
    ]);
  }
}
