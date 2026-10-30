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

  runApp(Document(
    title: 'Rami Obaid - Mobile Developer',
    head: [
      meta(charset: 'UTF-8'),
      meta(name: 'viewport', content: 'width=device-width, initial-scale=1.0'),
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
      link(rel: 'stylesheet', href: 'styles/main.css'),
    ],
    body: const App(),
  ));
}
