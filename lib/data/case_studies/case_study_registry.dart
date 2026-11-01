import 'package:jaspr/jaspr.dart';
import 'package:ramiobaid_portfolio/data/case_studies/movify_data.dart';
import 'package:ramiobaid_portfolio/models/case_study.dart';
import 'package:ramiobaid_portfolio/pages/case_studies/movify_page.dart';

/// Registry of Case Study data models (for metadata, info, etc.)
final Map<String, CaseStudyData> portfolioCaseStudies = {
  'movify': movifyCaseStudy,
};

/// Lookup helper for case study data
CaseStudyData getCaseStudy(String? id) {
  if (id == null) return movifyCaseStudy;
  return portfolioCaseStudies[id.toLowerCase()] ?? movifyCaseStudy;
}

/// Registry of Case Study page builders.
/// When adding a new project (e.g. 'fancy'), simply register it here:
/// `'fancy': () => const FancyCaseStudyPage(),`
final Map<String, Component Function()> caseStudyPageRegistry = {
  'movify': () => const MovifyCaseStudyPage(),
};

/// Lookup helper for case study pages
Component getCaseStudyPage(String? id) {
  final builder = caseStudyPageRegistry[id?.toLowerCase()];
  return builder != null ? builder() : const MovifyCaseStudyPage();
}
