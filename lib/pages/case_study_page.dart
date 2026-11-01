import 'package:jaspr/jaspr.dart';
import 'package:ramiobaid_portfolio/data/case_studies/case_study_registry.dart';

/// Router dispatcher component for Case Study pages.
/// Dynamically resolves the specific project page based on [id].
@client
class CaseStudyPage extends StatelessComponent {
  final String? id;

  const CaseStudyPage({this.id, super.key});

  @override
  Component build(BuildContext context) {
    return getCaseStudyPage(id);
  }
}
