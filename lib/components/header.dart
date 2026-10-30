import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:ramiobaid_portfolio/components/app_button.dart';
import 'package:ramiobaid_portfolio/constants/assets.dart';

class Header extends StatelessComponent {
  const Header({super.key});

  @override
  Component build(BuildContext context) {
    return header(classes: 'site-header', [
      a(classes: 'logo', href: '/', [
        img(src: AppAssets.rLogo, alt: 'Rami Obaid logo'),
      ]),
      nav(classes: 'main-nav', [
        a(href: '/', [Component.text('Home')]),
        a(href: '/#projects', [Component.text('Projects')]),
        a(href: '/#about', [Component.text('About me')]),
        a(href: '/#contact', [Component.text('Contact')]),
      ]),
      AppButton(
        label: "Let's Talk ",
        href: "mailto:ramiobaid545421@gmail.com",
        variant: ButtonVariant.contact,
        icon: AppAssets.mailIcon,
      ),
      details(classes: 'mobile-menu', [
        summary(
          attributes: {'aria-label': 'Toggle navigation menu'},
          [
            img(classes: 'menu-icon menu-icon--burger', src: AppAssets.optionsIcon, alt: 'Open menu'),
            img(classes: 'menu-icon menu-icon--close', src: AppAssets.xCircleIcon, alt: 'Close menu'),
          ],
        ),
        div(
          classes: 'mobile-backdrop',
          attributes: {'onclick': "this.closest('details').removeAttribute('open')"},
          [],
        ),
        nav(classes: 'mobile-nav', [
          a(href: '/', [Component.text('Home')]),
          a(href: '/#projects', [Component.text('Projects')]),
          a(href: '/#about', [Component.text('About me')]),
          a(href: '/#contact', [Component.text('Contact')]),
          AppButton(
            label: "Let's Talk ",
            href: "mailto:ramiobaid545421@gmail.com",
            variant: ButtonVariant.contact,
            icon: AppAssets.outlineMailIcon,
          ),
        ]),
      ]),
    ]);
  }
}
