import 'package:ramiobaid_portfolio/data/case_studies/movify_data.dart';
import 'package:ramiobaid_portfolio/models/case_study.dart';

/// Registry of all case studies in the portfolio.
final Map<String, CaseStudyData> portfolioCaseStudies = {
  'movify': movifyCaseStudy,
};

/// Lookup helper
CaseStudyData getCaseStudy(String? id) {
  if (id == null) return movifyCaseStudy;
  return portfolioCaseStudies[id.toLowerCase()] ?? movifyCaseStudy;
}
