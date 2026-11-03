import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:ramiobaid_portfolio/components/about_me.dart';
import 'package:ramiobaid_portfolio/components/footer.dart';
import 'package:ramiobaid_portfolio/components/header.dart';
import 'package:ramiobaid_portfolio/components/hero.dart';
import 'package:ramiobaid_portfolio/components/lets_ship_it.dart';
import 'package:ramiobaid_portfolio/components/projects.dart';

// By using the @client annotation this component will be automatically compiled to javascript and mounted
// on the client. Therefore:
// - this file and any imported file must be compilable for both server and client environments.
// - this component and any child components will be built once on the server during pre-rendering and then
//   again on the client during normal rendering.
class Home extends StatelessComponent {
  const Home({super.key});

  @override
  Component build(BuildContext context) {
    return div([
      const Header(),
      main_([
        const HeroSection(),
        const AboutMe(),
        const ProjectsSection(),
        const LetsShipIt(),
      ]),
      const Footer(),
    ]);
  }
}
