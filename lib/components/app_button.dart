import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

/// The visual variants of the button
enum ButtonVariant {
  primary,
  secondary,
  contact, // The yellow "Let's Talk" button
}

class AppButton extends StatelessComponent {
  final String label;
  final String href;
  final ButtonVariant variant;
  final String? icon; // Optional icon like "→", "↓", "✉"
  final bool iconLeading;
  final String? target;
  final String? download;
  final VoidCallback? onClick;

  const AppButton({
    required this.label,
    required this.href,
    this.variant = ButtonVariant.primary,
    this.icon,
    this.iconLeading = false,
    this.target,
    this.download,
    this.onClick,
    super.key,
  });

  // Maps the variant enum to the corresponding CSS class
  String get _variantClass {
    switch (variant) {
      case ButtonVariant.primary:
        return 'button button--primary';
      case ButtonVariant.secondary:
        return 'button button--secondary';
      case ButtonVariant.contact:
        return 'button button--accent';
    }
  }

  @override
  Component build(BuildContext context) {
    final iconWidget = icon != null
        ? span([
            img(
              src: icon!,
              width: 24,
              height: 24,
              alt: '',
            ),
          ])
        : null;

    return a(
      classes: _variantClass,
      href: href,
      onClick: onClick,
      attributes: {
        if (target != null) 'target': target!,
        if (download != null) 'download': download!,
      },
      [
        if (iconLeading && iconWidget != null) iconWidget,
        Component.text(label),
        if (!iconLeading && iconWidget != null) iconWidget,
      ],
    );
  }
}
