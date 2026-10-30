import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:ramiobaid_portfolio/components/app_button.dart';
import 'package:ramiobaid_portfolio/constants/assets.dart';
import 'package:ramiobaid_portfolio/models/project.dart';

/// Reusable project card component for the portfolio showcase.
class ProjectCard extends StatelessComponent {
  final ProjectItem project;

  const ProjectCard({
    required this.project,
    super.key,
  });

  @override
  Component build(BuildContext context) {
    return article(
      classes: 'project-card project-card--${project.id}',
      [
        // 1. Visual Mockups (Right on desktop, Top on mobile)

        // 2. Project Information & Details
        div(classes: 'project-card__info', [
          // Header: Icon + Title
          div(classes: 'project-card__header', [
            div(classes: 'project-card__icon-box', [
              img(
                classes: 'project-card__icon',
                src: project.appIcon,
                alt: '${project.title} App Icon',
              ),
            ]),
            h3(classes: 'text-h2 project-card__title', [
              Component.text(project.title),
            ]),
          ]),

          // Description
          p(classes: 'project-card__desc text-body-md', [
            Component.text(project.description),
          ]),

          // Tech Stack Capsule
          div(classes: 'project-card__tech-capsule', [
            for (final icon in project.techStack)
              img(
                classes: 'project-tech-icon',
                src: icon,
                alt: 'Tech Stack Icon',
              ),
          ]),

          // Desktop Actions (Side-by-side)
          div(classes: 'project-card__actions project-card__actions--desktop', [
            if (project.caseStudyUrl != null)
              AppButton(
                label: 'CASE STUDY',
                href: project.caseStudyUrl!,
                variant: ButtonVariant.contact,
                icon: AppAssets.arrowForward,
              ),
            if (project.googlePlayUrl != null)
              AppButton(
                label: 'GOOGLE PLAY',
                href: project.googlePlayUrl!,
                variant: ButtonVariant.primary,
                icon: AppAssets.googlePlayColored,
              ),
          ]),

          // Mobile Actions (Stacked button + link)
          div(classes: 'project-card__actions project-card__actions--mobile', [
            if (project.caseStudyUrl != null)
              AppButton(
                label: 'VIEW CASE STUDY',
                href: project.caseStudyUrl!,
                variant: ButtonVariant.contact,
                icon: AppAssets.arrowForward,
              ),
            if (project.googlePlayUrl != null)
              a(
                classes: 'project-card__google-play-link',
                href: project.googlePlayUrl!,
                target: Target.blank,
                [Component.text('Get it on Google Play ↗')],
              ),
          ]),
        ]),
        div(classes: 'project-card__visual--desktop', [
          div(classes: 'project-card__visual-backdrop', []),
          img(
            classes: 'project-card__mockup--desktop',
            src: project.desktopMockup,
            alt: '${project.title} Mockups',
          ),
        ]),
        div(classes: 'project-card__visual--mobile', [
          div(classes: 'project-card__visual-backdrop', []),
          img(
            classes: 'project-card__mockup--mobile',
            src: project.mobileMockup,
            alt: '${project.title} Mockups',
          ),
        ]),
      ],
    );
  }
}
