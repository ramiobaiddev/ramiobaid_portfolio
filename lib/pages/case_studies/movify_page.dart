import 'package:jaspr/jaspr.dart';
import 'package:ramiobaid_portfolio/components/case_study/case_study_challenges.dart';
import 'package:ramiobaid_portfolio/components/case_study/case_study_cta.dart';
import 'package:ramiobaid_portfolio/components/case_study/case_study_engineering.dart';
import 'package:ramiobaid_portfolio/components/case_study/case_study_gallery.dart';
import 'package:ramiobaid_portfolio/components/case_study/case_study_hero.dart';
import 'package:ramiobaid_portfolio/components/case_study/case_study_layout.dart';
import 'package:ramiobaid_portfolio/components/case_study/case_study_metrics.dart';
import 'package:ramiobaid_portfolio/components/case_study/case_study_offline.dart';
import 'package:ramiobaid_portfolio/components/case_study/case_study_problem.dart';
import 'package:ramiobaid_portfolio/components/case_study/case_study_structure.dart';
import 'package:ramiobaid_portfolio/components/case_study/case_study_vision.dart';
import 'package:ramiobaid_portfolio/components/case_study/case_study_visual.dart';
import 'package:ramiobaid_portfolio/components/case_study/case_study_wireframes.dart';
import 'package:ramiobaid_portfolio/data/case_studies/movify_data.dart';

class MovifyCaseStudyPage extends StatelessComponent {
  const MovifyCaseStudyPage({super.key});

  @override
  Component build(BuildContext context) {
    const data = movifyCaseStudy;

    return CaseStudyLayout(
      id: data.id,
      appTitle: data.appTitle,
      theme: data.theme,
      children: [
        CaseStudyHero(data: data.hero),
        CaseStudyMetrics(data: data),
        CaseStudyProblem(data: data.problem),
        CaseStudyVision(data: data.vision),
        CaseStudyStructure(data: data.structure),
        CaseStudyWireframes(data: data.wireframes),
        CaseStudyVisual(data: data.visual),
        CaseStudyEngineering(data: data.engineering),
        CaseStudyChallenges(data: data.challenges),
        CaseStudyOffline(data: data.offline),
        CaseStudyGallery(data: data.gallery),
        CaseStudyCta(data: data.cta),
      ],
    );
  }
}
