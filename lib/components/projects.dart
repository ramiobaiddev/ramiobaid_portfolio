import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:ramiobaid_portfolio/components/project_card.dart';
import 'package:ramiobaid_portfolio/components/section_eyebrow.dart';
import 'package:ramiobaid_portfolio/models/project_model.dart';

/// The Projects showcase section.
class ProjectsSection extends StatelessComponent {
  const ProjectsSection({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'projects', classes: 'projects-section', [
      // 1. Eyebrow
      const SectionEyebrow(
        text: 'SELECTED WORK',
        color: EyebrowColor.blue,
      ),

      // 2. Section Heading
      h2(classes: 'text-h1 projects-heading', [
        span([Component.text('Apps I’ve ')]),
        span(classes: 'title-accent', [Component.text('Shipped')]),
      ]),

      // 3. Project Cards Showcase
      div(classes: 'projects-list', [
        for (final project in portfolioProjects) ProjectCard(project: project),
      ]),
    ]);
  }
}
