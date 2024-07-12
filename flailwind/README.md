# Flailwind

[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]

Tailwind-like styling in Flutter.

## Text Styling

Styling aligned to how tailwind does it.

```dart
Text('my fancy header', style: context.h1.thin.wide.primary.underline)
```

```dart
Text('header 1', style: context.h1)
Text('header 2', style: context.h2)
Text('header 3', style: context.h3)
Text('paragraph', style: context.p)

// bold or italic
Text('style with bold', style: context.p.italic)
Text('style with italic', style: context.p.bold)

// text decorations
Text('underline', style: context.p.underline),
Text('lineThrough', style: context.p.lineThrough),

// character spacing
Text('extra tight', style: context.p.extraTight),
Text('tight', style: context.p.tight)
Text('wide', style: context.p.wide)
Text('extra wide', style: context.p.extraWide)

// font weight
Text('thin', style: context.p.thin),
Text('bold', style: context.p.bold),

// font size
Text('small', style: context.p.sm),
Text('medium', style: context.p.md),
Text('large', style: context.p.lg),
Text('xl', style: context.p.xl),
Text('2xl', style: context.p.xxl),
Text('3xl', style: context.p.xxxl),

// overflow
Text('clip', style: context.p.clip),
Text('ellipsis', style: context.p.ellipsis),
Text('fade', style: context.p.fade),
Text('visible', style: context.p.visible),

// text color
Text('primary', style: context.p.primary),
Text('secondary', style: context.p.secondary),
Text('tertiary', style: context.p.tertiary),
Text('error', style: context.p.error),

Text('onPrimary', style: context.p.onPrimary),
Text('onSecondary', style: context.p.onSecondary),
Text('onTertiary', style: context.p.onTertiary),
Text('onError', style: context.p.onError),

// background color
Text('bgPrimary', style: context.p.bgPrimary),
Text('bgSecondary', style: context.p.bgSecondary),
Text('bgError', style: context.p.bgError),
Text('bgTertiary', style: context.p.bgTertiary),
```

## Colors

Easier access to common colors.

```dart
Card(child: child, color: context.primary)
Card(child: child, color: context.secondary)
Card(child: child, color: context.tertiary)
Card(child: child, color: context.error)

Card(child: child, color: context.onPrimary)
Card(child: child, color: context.onSecondary)
Card(child: child, color: context.onTertiary)
Card(child: child, color: context.onError)

Card(child: child, color: context.bgPrimary)
Card(child: child, color: context.bgSecondary)
Card(child: child, color: context.bgTertiary)
Card(child: child, color: context.bgError)
```

[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
