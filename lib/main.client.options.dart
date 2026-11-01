// dart format off
// ignore_for_file: type=lint

// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/client.dart';

import 'package:ramiobaid_portfolio/pages/case_studies/movify_page.dart'
    deferred as _movify_page;
import 'package:ramiobaid_portfolio/pages/case_study_page.dart'
    deferred as _case_study_page;

/// Default [ClientOptions] for use with your Jaspr project.
///
/// Use this to initialize Jaspr **before** calling [runApp].
///
/// Example:
/// ```dart
/// import 'main.client.options.dart';
///
/// void main() {
///   Jaspr.initializeApp(
///     options: defaultClientOptions,
///   );
///
///   runApp(...);
/// }
/// ```
ClientOptions get defaultClientOptions => ClientOptions(
  clients: {
    'movify_page': ClientLoader(
      (p) => _movify_page.MovifyCaseStudyPage(),
      loader: _movify_page.loadLibrary,
    ),
    'case_study_page': ClientLoader(
      (p) => _case_study_page.CaseStudyPage(id: p['id'] as String?),
      loader: _case_study_page.loadLibrary,
    ),
  },
);
