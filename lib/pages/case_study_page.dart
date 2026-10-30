import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:ramiobaid_portfolio/components/case_study/case_study_challenges.dart';
import 'package:ramiobaid_portfolio/components/case_study/case_study_cta.dart';
import 'package:ramiobaid_portfolio/components/case_study/case_study_engineering.dart';
import 'package:ramiobaid_portfolio/components/case_study/case_study_gallery.dart';
import 'package:ramiobaid_portfolio/components/case_study/case_study_hero.dart';
import 'package:ramiobaid_portfolio/components/case_study/case_study_metrics.dart';
import 'package:ramiobaid_portfolio/components/case_study/case_study_offline.dart';
import 'package:ramiobaid_portfolio/components/case_study/case_study_problem.dart';
import 'package:ramiobaid_portfolio/components/case_study/case_study_structure.dart';
import 'package:ramiobaid_portfolio/components/case_study/case_study_vision.dart';
import 'package:ramiobaid_portfolio/components/case_study/case_study_visual.dart';
import 'package:ramiobaid_portfolio/components/case_study/case_study_wireframes.dart';
import 'package:ramiobaid_portfolio/components/footer.dart';
import 'package:ramiobaid_portfolio/data/case_studies/case_study_registry.dart';
import 'package:ramiobaid_portfolio/models/case_study.dart';

@client
class CaseStudyPage extends StatelessComponent {
  final String? id;

  const CaseStudyPage({this.id, super.key});

  @override
  Component build(BuildContext context) {
    final CaseStudyData data = getCaseStudy(id);
    return div(
      classes: 'case-study-page case-study--${data.id}',
      styles: Styles(
        raw: {
          '--cs-primary': data.theme.primaryColor,
          '--cs-accent': data.theme.accentColor,
          '--cs-hero-bg': data.theme.heroGradient,
          '--cs-problem-bg': data.theme.problemBgColor,
        },
      ),
      [
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
        Footer(),
      ],
    );
  }
}
