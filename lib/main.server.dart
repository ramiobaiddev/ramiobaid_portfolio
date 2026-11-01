/// The entrypoint for the **server** environment.
library;

import 'package:jaspr/dom.dart';
import 'package:jaspr/server.dart';

import 'app.dart';
import 'main.server.options.dart';

void main() {
  Jaspr.initializeApp(
    options: defaultServerOptions,
  );

  runApp(
    Document(
      title: 'Rami Obaid — Mobile Developer | Flutter & Figma',
      base: '/',
      meta: {
        'description':
            'Portfolio of Rami Obaid - Mobile Developer designing in Figma and building high-performance cross-platform apps in Flutter.',
        'author': 'Rami Obaid',
        'keywords':
            'Rami Obaid, Mobile Developer, Flutter, Dart, Figma, UI/UX Designer, Clean Architecture, Android, iOS',
        'theme-color': '#0052FF',
      },
      head: [
        link(rel: 'icon', type: 'image/x-icon', href: '/favicon.ico'),
        // Open Graph / Social Sharing
        meta(attributes: {'property': 'og:type', 'content': 'website'}),
        meta(attributes: {'property': 'og:site_name', 'content': 'Rami Obaid Portfolio'}),
        meta(
          attributes: {
            'property': 'og:title',
            'content': 'Rami Obaid — Mobile Developer | Flutter & Figma',
          },
        ),
        meta(
          attributes: {
            'property': 'og:description',
            'content':
                'I design mobile experiences in Figma and build them in Flutter — from first concept to shipped app.',
          },
        ),
        meta(
          attributes: {
            'property': 'og:image',
            'content': '/assets/movify/movify-project-mockups.png',
          },
        ),
        // Twitter Cards
        meta(name: 'twitter:card', content: 'summary_large_image'),
        meta(name: 'twitter:title', content: 'Rami Obaid — Mobile Developer | Flutter & Figma'),
        meta(
          name: 'twitter:description',
          content:
              'I design mobile experiences in Figma and build them in Flutter — from first concept to shipped app.',
        ),
        meta(name: 'twitter:image', content: '/assets/movify/movify-project-mockups.png'),
        // Fonts & Stylesheets
        link(rel: 'preconnect', href: 'https://fonts.googleapis.com'),
        link(
          rel: 'preconnect',
          href: 'https://fonts.gstatic.com',
          attributes: {'crossorigin': ''},
        ),
        link(
          rel: 'stylesheet',
          href: 'https://fonts.googleapis.com/css2?family=Montserrat:wght@500;600;700;800&display=swap',
        ),
        link(rel: 'stylesheet', href: '/styles/main.css'),
        // Motion & Interaction Scripts
        script(
          src: '/hero_particles.js',
          defer: true,
        ),
        script(
          src: '/scroll_reveal.js',
          defer: true,
        ),
        script(
          src: '/progress_bar.js',
          defer: true,
        ),
        script(
          src: '/case_study_motion.js',
          defer: true,
        ),
      ],
      body: const App(),
    ),
  );
}
