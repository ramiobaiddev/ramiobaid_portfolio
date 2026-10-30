// dart format off
// ignore_for_file: type=lint

// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/server.dart';
import 'package:ramiobaid_portfolio/constants/theme.dart' as _theme;
import 'package:ramiobaid_portfolio/pages/case_study_page.dart'
    as _case_study_page;
import 'package:ramiobaid_portfolio/pages/home.dart' as _home;
import 'package:ramiobaid_portfolio/app.dart' as _app;

/// Default [ServerOptions] for use with your Jaspr project.
///
/// Use this to initialize Jaspr **before** calling [runApp].
///
/// Example:
/// ```dart
/// import 'main.server.options.dart';
///
/// void main() {
///   Jaspr.initializeApp(
///     options: defaultServerOptions,
///   );
///
///   runApp(...);
/// }
/// ```
ServerOptions get defaultServerOptions => ServerOptions(
  clientId: 'main.client.dart.js',
  clients: {
    _case_study_page.CaseStudyPage:
        ClientTarget<_case_study_page.CaseStudyPage>(
          'case_study_page',
          params: __case_study_pageCaseStudyPage,
        ),
    _home.Home: ClientTarget<_home.Home>('home'),
  },
  styles: () => [..._theme.styles, ..._app.App.styles],
);

Map<String, Object?> __case_study_pageCaseStudyPage(
  _case_study_page.CaseStudyPage c,
) => {'id': c.id};
