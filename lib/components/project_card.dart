import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:ramiobaid_portfolio/components/app_button.dart';
import 'package:ramiobaid_portfolio/constants/assets.dart';
import 'package:ramiobaid_portfolio/models/project_model.dart';

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
      classes: 'project-card',
      styles: Styles(
        raw: {'--desktop-card-background': project.desktopGradient, '--mobile-card-background': project.mobileGradient},
      ),
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
                alt: '',
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
                attributes: {
                  'rel': 'noopener noreferrer',
                  'aria-label': 'Get ${project.title} on Google Play',
                },
                [Component.text('Get it on Google Play ↗')],
              ),
          ]),
        ]),
        div(classes: 'project-card__visual', [
          div(classes: 'project-card__visual-backdrop', []),
          Component.element(
            tag: 'picture',
            children: [
              source(
                attributes: {
                  'media': '(max-width: 820px)',
                  'srcset': project.mobileMockup,
                },
              ),
              img(
                classes: 'project-card__mockup',
                src: project.desktopMockup,
                alt: '${project.title} Mockups',
                attributes: {
                  'loading': 'lazy',
                  'decoding': 'async',
                },
              ),
            ],
          ),
        ]),
      ],
    );
  }
}
