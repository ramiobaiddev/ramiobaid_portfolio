import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:ramiobaid_portfolio/components/footer.dart';
import 'package:ramiobaid_portfolio/models/case_study.dart';

/// Reusable layout wrapper / shell for all Case Study pages.
/// Encapsulates theme CSS variables, outer styling, and common components (e.g. Footer).
class CaseStudyLayout extends StatelessComponent {
  final String id;
  final String? appTitle;
  final CaseStudyTheme theme;
  final List<Component> children;

  const CaseStudyLayout({
    required this.id,
    this.appTitle,
    required this.theme,
    required this.children,
    super.key,
  });

  @override
  Component build(BuildContext context) {
    final titleString = (appTitle != null && appTitle!.isNotEmpty)
        ? '$appTitle — Case Study'
        : 'Case Study | Rami Obaid';

    return Component.fragment([
      Document.head(
        title: titleString,
      ),
      div(
        classes: 'case-study-page case-study--$id',
        styles: Styles(
          raw: {
            '--cs-primary': theme.primaryColor,
            '--cs-accent': theme.accentColor,
            '--cs-hero-bg': theme.heroGradient,
            '--cs-problem-bg': theme.problemBgColor,
          },
        ),
        [
          main_(children),
          const Footer(),
        ],
      ),
    ]);
  }
}
