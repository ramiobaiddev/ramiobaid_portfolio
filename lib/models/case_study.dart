/// Models for scalable and data-driven Case Study pages.
class CaseStudyTheme {
  final String primaryColor;
  final String accentColor;
  final String heroGradient;
  final String problemBgColor;

  const CaseStudyTheme({
    required this.primaryColor,
    required this.accentColor,
    required this.heroGradient,
    required this.problemBgColor,
  });
}

class CaseStudyHeroData {
  final String tagline;
  final String title;
  final String subtitle;
  final String description;
  final String? rating;
  final String? downloads;
  final String mockupImage;
  final String? googlePlayUrl;
  final String? githubUrl;
  final List<String> techStack;

  const CaseStudyHeroData({
    this.tagline = '',
    required this.title,
    required this.subtitle,
    this.description = '',
    this.rating,
    this.downloads,
    required this.mockupImage,
    this.googlePlayUrl,
    this.githubUrl,
    this.techStack = const [],
  });
}

class CaseStudyProblemData {
  final String eyebrow;
  final String title;
  final String description;

  const CaseStudyProblemData({
    this.eyebrow = 'THE CHALLENGE',
    required this.title,
    required this.description,
  });
}

class VisionPillar {
  final String badge;
  final String title;
  final String description;

  const VisionPillar({
    required this.badge,
    required this.title,
    required this.description,
  });
}

class CaseStudyVisionData {
  final String eyebrow;
  final String title;
  final String description;
  final List<VisionPillar> pillars;

  const CaseStudyVisionData({
    this.eyebrow = 'VISION',
    required this.title,
    required this.description,
    this.pillars = const [],
  });
}

class CaseStudyStructureData {
  final String eyebrow;
  final String title;
  final String subtitle;
  final String description;
  final String diagramImage;

  const CaseStudyStructureData({
    this.eyebrow = 'INFORMATION ARCHITECTURE',
    required this.title,
    required this.subtitle,
    required this.description,
    required this.diagramImage,
  });
}

class CaseStudyWireframesData {
  final String eyebrow;
  final String title;
  final String description;
  final List<String> wireframes;

  const CaseStudyWireframesData({
    this.eyebrow = 'WIREFRAMES',
    required this.title,
    required this.description,
    required this.wireframes,
  });
}

class CaseStudyVisualData {
  final String eyebrow;
  final String title;
  final String description;
  final String spotlightMockup;
  final List<String> showcaseScreens;

  const CaseStudyVisualData({
    this.eyebrow = 'VISUAL DESIGN',
    required this.title,
    required this.description,
    required this.spotlightMockup,
    required this.showcaseScreens,
  });
}

class EngineeringLayer {
  final String badge;
  final String title;
  final String description;

  const EngineeringLayer({
    required this.badge,
    required this.title,
    required this.description,
  });
}

class CaseStudyEngineeringData {
  final String eyebrow;
  final String title;
  final String subtitle;
  final String description;
  final List<EngineeringLayer> layers;

  const CaseStudyEngineeringData({
    this.eyebrow = 'ARCHITECTURE',
    required this.title,
    required this.subtitle,
    required this.description,
    required this.layers,
  });
}

class ChallengeCard {
  final String metric;
  final String label;
  final String description;

  const ChallengeCard({
    required this.metric,
    required this.label,
    required this.description,
  });
}

class CaseStudyChallengesData {
  final String eyebrow;
  final String title;
  final String description;
  final List<ChallengeCard> cards;

  const CaseStudyChallengesData({
    this.eyebrow = 'PERFORMANCE & ROADBLOCKS',
    required this.title,
    required this.description,
    required this.cards,
  });
}

class OfflineFlowStep {
  final String step;
  final String title;

  const OfflineFlowStep({required this.step, required this.title});
}

class CaseStudyOfflineData {
  final String eyebrow;
  final String title;
  final String description;
  final String? secondaryDescription;
  final String flowEyebrow;
  final List<OfflineFlowStep> flowSteps;
  final List<String> techBadges;
  final List<String> mockups;
  final String mockupLabel;

  const CaseStudyOfflineData({
    this.eyebrow = '03 / OFFLINE FAVORITES',
    required this.title,
    required this.description,
    this.secondaryDescription,
    this.flowEyebrow = 'OFFLINE-FIRST FLOW',
    this.flowSteps = const [
      OfflineFlowStep(step: '01 →', title: 'Local storage'),
      OfflineFlowStep(step: '02 →', title: 'Offline access'),
      OfflineFlowStep(step: '03', title: 'Firebase sync'),
    ],
    this.techBadges = const [],
    this.mockups = const [],
    this.mockupLabel = 'FAVORITES / MOVIFY',
  });
}

class GalleryCategory {
  final String title;
  final List<String> screenshots;

  const GalleryCategory({
    required this.title,
    required this.screenshots,
  });
}

class CaseStudyGalleryData {
  final String eyebrow;
  final String title;
  final String accentTitle;
  final List<GalleryCategory> categories;

  const CaseStudyGalleryData({
    this.eyebrow = 'THE COMPLETE EXPERIENCE',
    required this.title,
    required this.accentTitle,
    required this.categories,
  });
}

class CaseStudyCtaData {
  final String? eyebrow;
  final String title;
  final String subtitle;
  final String? googlePlayUrl;
  final String? githubUrl;

  const CaseStudyCtaData({
    this.eyebrow,
    required this.title,
    required this.subtitle,
    this.googlePlayUrl,
    this.githubUrl,
  });
}

/// The master Case Study Data model.
class CaseStudyData {
  final String id;
  final String appTitle;
  final CaseStudyTheme theme;
  final CaseStudyHeroData hero;
  final CaseStudyProblemData problem;
  final CaseStudyVisionData vision;
  final CaseStudyStructureData structure;
  final CaseStudyWireframesData wireframes;
  final CaseStudyVisualData visual;
  final CaseStudyEngineeringData engineering;
  final CaseStudyChallengesData challenges;
  final CaseStudyOfflineData offline;
  final CaseStudyGalleryData gallery;
  final CaseStudyCtaData cta;

  const CaseStudyData({
    required this.id,
    required this.appTitle,
    required this.theme,
    required this.hero,
    required this.problem,
    required this.vision,
    required this.structure,
    required this.wireframes,
    required this.visual,
    required this.engineering,
    required this.challenges,
    required this.offline,
    required this.gallery,
    required this.cta,
  });
}
