import 'package:ramiobaid_portfolio/constants/assets.dart';

/// Represents a showcased project in the portfolio.
class ProjectItem {
  final String id;
  final String title;
  final String appIcon;
  final String description;
  final String mobileMockup;
  final String desktopMockup;
  final String desktopGradient;
  final String mobileGradient;
  final List<String> techStack;
  final String? caseStudyUrl;
  final String? googlePlayUrl;

  const ProjectItem({
    required this.id,
    required this.title,
    required this.appIcon,
    required this.description,
    required this.mobileMockup,
    required this.desktopMockup,
    this.desktopGradient = 'linear-gradient(270deg, #CCDAFF 0%, #4776EB 40%, #294BA3 60%, #00103A 100%)',
    this.mobileGradient = 'linear-gradient(180deg, #0B132B 0%, #050B1A 100%)',
    required this.techStack,
    this.caseStudyUrl,
    this.googlePlayUrl,
  });
}

/// The list of projects displayed in the portfolio.
const List<ProjectItem> portfolioProjects = [
  ProjectItem(
    id: 'movify',
    title: 'MOVIFY',
    appIcon: AppAssets.movifyIcon,
    description: 'A movie & TV discovery app, designed in Figma and built with Flutter.',
    mobileMockup: AppAssets.movifyMobileMockups,
    desktopMockup: AppAssets.movifyDesktopMockups,
    desktopGradient: 'linear-gradient(90deg, #CCDAFF 0%, #4776EB 40%, #294BA3 60%,#00103A 100%)',
    mobileGradient: 'linear-gradient(180deg, #CCDAFF 0%, #4776EB 40%, #294BA3 60%,#00103A 100%)',
    techStack: [
      AppAssets.figma,
      AppAssets.flutter,
      AppAssets.dart,
      AppAssets.firebase,
    ],
    caseStudyUrl: '/case-study/movify',
    googlePlayUrl: 'https://play.google.com/store/apps/details?id=com.rami.movify',
  ),
];
