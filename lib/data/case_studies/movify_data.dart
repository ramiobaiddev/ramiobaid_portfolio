import 'package:ramiobaid_portfolio/constants/assets.dart';
import 'package:ramiobaid_portfolio/models/case_study.dart';

/// Complete case study data for MOVIFY.
const CaseStudyData movifyCaseStudy = CaseStudyData(
  id: 'movify',
  appTitle: 'MOVIFY',
  theme: CaseStudyTheme(
    primaryColor: '#0052FF',
    accentColor: '#FFAA01',
    heroGradient: 'linear-gradient(90deg, #012266 0%, #0156ff 50%, #679aff 100%)',
    problemBgColor: '#FFAA01',
  ),

  // 1. Hero Showcase
  hero: CaseStudyHeroData(
    title: 'MOVIFY',
    subtitle: 'A place to discover movies & TV.',
    description: 'A movie and TV discovery app designed in Figma and built in Flutter, shipped to Google Play.',
    mockupImage: AppAssets.movifyCaseStudyMockup,
    googlePlayUrl: 'https://play.google.com/store/apps/details?id=com.rami.movify',
    githubUrl: 'https://github.com/ramiobaiddev/Movify',
    techStack: [
      AppAssets.figma,
      AppAssets.flutter,
      AppAssets.tmdbIcon,
      AppAssets.firebase,
    ],
  ),

  // 2. The Problem
  problem: CaseStudyProblemData(
    eyebrow: '01 / THE CHALLENGE',
    title: "There's too much to watch.",
    description:
        "Modern movie discovery is broken by decision fatigue. Viewers spend up to 20 minutes scrolling through overwhelming catalogs across multiple streaming services before deciding what to watch. Movify was created to bring back serendipity, clean curation, and effortless decision-making.",
  ),

  // 3. The Vision & Pillars
  vision: CaseStudyVisionData(
    eyebrow: '02 / THE IDEA',
    title: 'What if discovering movies felt effortless?',
    description:
        'Movify was designed around a simple idea: give people a place where they can discover, explore, and save what they want to watch — without getting lost in the process..',
    pillars: [
      VisionPillar(
        badge: 'EFFORTLESS',
        title: 'Frictionless Browsing',
        description: 'Gesture-driven UI that gets out of the way of the content.',
      ),
      VisionPillar(
        badge: 'INTUITIVE',
        title: 'Deep Movie Insights',
        description: 'Trailers, cast filmographies, and reviews in one cohesive tab.',
      ),
      VisionPillar(
        badge: 'FAST',
        title: 'Instant Offline Access',
        description: 'Your watchlist and bookmarked favorites always available offline.',
      ),
    ],
  ),

  // 4. Structure & IA
  structure: CaseStudyStructureData(
    eyebrow: '03 / INFORMATION ARCHITECTURE',
    title: 'STRUCTURE.',
    subtitle: 'Before designing screens, I had to understand the structure.',
    description: '',
    diagramImage: AppAssets.movifyIA,
  ),

  // 5. Wireframes
  wireframes: CaseStudyWireframesData(
    eyebrow: '04 / WIREFRAMES',
    title: 'The first version was about getting the structure right.',
    description:
        'Before thinking about colors, imagery, or animations, I focused on hierarchy and navigation. The wireframes helped me test how the main pieces of the experience should fit together.',
    wireframes: [
      AppAssets.movifyWfHome,
      AppAssets.movifyWfDetails,
      AppAssets.movifyWfCollection,
      AppAssets.movifyWfGenre,
      AppAssets.movifyWfSeason,
      AppAssets.movifyWfFavorite,
    ],
  ),

  // 6. Visual Design Transformation
  visual: CaseStudyVisualData(
    eyebrow: '05 / TRANSFORMATION',
    title: 'Then the interface started to feel like Movify.',
    description:
        'I wanted the interface to feel cinematic without sacrificing clarity. Strong imagery creates visual interest, while consistent spacing, typography, cards, and navigation keep the experience easy to understand.',
    spotlightMockup: AppAssets.movifyScreenHome,
    showcaseScreens: [
      AppAssets.movifyScreenHome,

      AppAssets.movifyScreenDetails,

      AppAssets.movifyScreenCollection,
      AppAssets.movifyScreenGenre,
      AppAssets.movifyScreenSeason,
      AppAssets.movifyScreenFavorites,
    ],
  ),

  // 7. Engineering Architecture
  engineering: CaseStudyEngineeringData(
    eyebrow: '01 / Clean Architecture',
    title: 'Engineering.',
    subtitle: 'Designed to grow, not just to work',
    description:
        'I structured Movify using Clean Architecture, separating the presentation, business logic, and data layers. This keeps features independent and makes the codebase easier to maintain as the app grows.',
    layers: [
      EngineeringLayer(
        badge: 'L1 / ↓',
        title: 'Presentation',
        description: '',
      ),
      EngineeringLayer(
        badge: 'L2 / ↓',
        title: 'Business logic',
        description: '',
      ),
      EngineeringLayer(
        badge: 'L3 / ◆',
        title: 'Data',
        description: '',
      ),
    ],
  ),

  // 8. Performance Challenges Solved
  challenges: CaseStudyChallengesData(
    eyebrow: '02 / PERFORMANCE',
    title: "The UI looked good. But it wasn't always smooth.",
    description: 'Image-heavy screens introduced noticeable frame drops during scrolling and transitions.',
    cards: [
      ChallengeCard(
        metric: '60 FPS',
        label: 'Zero Scroll Jank',
        description: 'Implemented custom ListView slivers and memory-efficient image decoders.',
      ),
      ChallengeCard(
        metric: '100 ms',
        label: 'Poster Caching',
        description: 'Two-tier caching strategy (Memory + Disk) to eliminate blank poster placeholders.',
      ),
      ChallengeCard(
        metric: '-45%',
        label: 'Network Payload',
        description: 'Optimized TMDB API query projection to only fetch necessary field schemas.',
      ),
      ChallengeCard(
        metric: '0 MB',
        label: 'Memory Leak Clean',
        description: 'Strict lifecycle disposal for animations, stream controllers, and video players.',
      ),
    ],
  ),

  // 9. Offline First Feature
  offline: CaseStudyOfflineData(
    eyebrow: '03 / OFFLINE FAVORITES',
    title: "Favorites shouldn't disappear when you're offline.",
    description: 'I wanted favorites to feel instant and reliable, even without a network connection.',
    secondaryDescription:
        'Movify stores favorites locally with Hive and synchronizes them with Firestore when the user is authenticated and connected.',
    flowEyebrow: 'OFFLINE-FIRST FLOW',
    flowSteps: [
      OfflineFlowStep(step: '01 →', title: 'Local storage'),
      OfflineFlowStep(step: '02 →', title: 'Offline access'),
      OfflineFlowStep(step: '03', title: 'Firebase sync'),
    ],
    techBadges: [
      AppAssets.figma,
      AppAssets.flutter,
      AppAssets.dart,
      AppAssets.firebase,
      AppAssets.tmdbIcon,
    ],
    mockups: [
      AppAssets.movifyScreenFavorites,
    ],
    mockupLabel: 'FAVORITES / MOVIFY',
  ),

  // 10. The App - Complete Gallery
  gallery: CaseStudyGalleryData(
    eyebrow: '06 / MOVIFY FINAL UI',
    title: 'From an idea to a product people can actually use.',
    accentTitle: 'THE APP.',
    categories: [
      GalleryCategory(
        title: 'DISCOVERY & EXPLORATION',
        screenshots: [
          AppAssets.movifyScreenHome,
          AppAssets.movifyScreenDiscover,
          AppAssets.movifyScreenSearch,
          AppAssets.movifyScreenGenre,
        ],
      ),
      GalleryCategory(
        title: 'DETAILS & SEASONS',
        screenshots: [
          AppAssets.movifyScreenDetails,
          AppAssets.movifyScreenSeason,
          AppAssets.movifyScreenEpisode,
          AppAssets.movifyScreenFilter,
        ],
      ),
      GalleryCategory(
        title: 'COLLECTIONS & USER PROFILE',
        screenshots: [
          AppAssets.movifyScreenCollection,

          AppAssets.movifyTabRecommended,
          AppAssets.movifyScreenFavorites,
          AppAssets.movifyScreenProfile,
        ],
      ),
    ],
  ),

  // 11. Final Call-to-Action
  cta: CaseStudyCtaData(
    eyebrow: 'MOVIFY / AVAILABLE ON ANDROID',
    title: 'Explore MOVIFY for\nyourself.',
    subtitle: 'The movie & TV discovery app, available on Android.',
    googlePlayUrl: 'https://play.google.com/store/apps/details?id=com.rami.movify',
    githubUrl: 'https://github.com/ramiobaiddev/Movify',
  ),
);
