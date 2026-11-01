import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:ramiobaid_portfolio/components/footer.dart';
import 'package:ramiobaid_portfolio/models/case_study.dart';

/// Reusable layout wrapper / shell for all Case Study pages.
/// Encapsulates theme CSS variables, outer styling, and common components (e.g. Footer).
class CaseStudyLayout extends StatelessComponent {
  final String id;
  final CaseStudyTheme theme;
  final List<Component> children;

  const CaseStudyLayout({
    required this.id,
    required this.theme,
    required this.children,
    super.key,
  });

  @override
  Component build(BuildContext context) {
    return div(
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
        ...children,
        const Footer(),
      ],
    );
  }
}
