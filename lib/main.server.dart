/// The entrypoint for the **server** environment.
library;

import 'package:jaspr/dom.dart';
import 'package:jaspr/server.dart';
import 'package:ramiobaid_portfolio/constants/assets.dart';

import 'app.dart';
import 'constants/personal_data.dart';
import 'main.server.options.dart';

void main() {
  Jaspr.initializeApp(
    options: defaultServerOptions,
  );

  runApp(
    Document(
      title: 'Rami Obaid — Mobile Developer | Flutter & Figma',
      base: '/',
      lang: 'en',
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
        link(rel: 'canonical', href: '${PersonalData.siteUrl}/'),
        // Preload LCP Hero Image for maximum performance
        link(
          rel: 'preload',
          href: AppAssets.portrait,
          attributes: {
            'as': 'image',
            'type': 'image/avif',
            'fetchpriority': 'high',
          },
        ),
        // Open Graph / Social Sharing
        meta(attributes: {'property': 'og:type', 'content': 'website'}),
        meta(attributes: {'property': 'og:site_name', 'content': 'Rami Obaid Portfolio'}),
        meta(attributes: {'property': 'og:url', 'content': '${PersonalData.siteUrl}/'}),
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
            'content': '${PersonalData.siteUrl}/assets/general/og_preview.png',
          },
        ),
        meta(attributes: {'property': 'og:image:type', 'content': 'image/png'}),
        meta(attributes: {'property': 'og:image:alt', 'content': 'Rami Obaid - Mobile Developer'}),
        // Twitter Cards
        meta(name: 'twitter:card', content: 'summary_large_image'),
        meta(name: 'twitter:title', content: 'Rami Obaid — Mobile Developer | Flutter & Figma'),
        meta(
          name: 'twitter:description',
          content:
              'I design mobile experiences in Figma and build them in Flutter — from first concept to shipped app.',
        ),
        meta(
          name: 'twitter:image',
          content: '${PersonalData.siteUrl}/assets/general/og_preview.png',
        ),
        // Structured Data (JSON-LD) for Search Engine Rich Snippets
        script(
          attributes: {'type': 'application/ld+json'},
          content:
              '{"@context":"https://schema.org","@type":"Person","name":"Rami Obaid","jobTitle":"Mobile Developer","url":"${PersonalData.siteUrl}","image":"${PersonalData.siteUrl}/assets/general/og_preview.png","sameAs":["${PersonalData.github}","${PersonalData.linkedin}","${PersonalData.instagram}","${PersonalData.facebook}"]}',
        ),
        // Fonts & Stylesheets (Non-blocking async font loading + consolidated production bundle)
        link(rel: 'preconnect', href: 'https://fonts.googleapis.com'),
        link(
          rel: 'preconnect',
          href: 'https://fonts.gstatic.com',
          attributes: {'crossorigin': ''},
        ),
        link(
          rel: 'stylesheet',
          href: 'https://fonts.googleapis.com/css2?family=Montserrat:wght@500;600;700;800&display=swap',
          attributes: {
            'media': 'print',
            'onload': "this.media='all'",
          },
        ),
        link(rel: 'stylesheet', href: '/styles/bundle.css'),
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
