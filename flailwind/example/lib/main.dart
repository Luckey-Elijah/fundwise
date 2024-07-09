import 'package:flailwind/flailwind.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: ExamplePage()));

class ExamplePage extends StatelessWidget {
  const ExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(
        children: [
          Expanded(child: BaseStyles()),
          Expanded(child: ColorStyles()),
        ],
      ),
    );
  }
}

class BaseStyles extends StatelessWidget {
  const BaseStyles({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: [
        Text('header 1', style: context.h1),
        Text('header 2', style: context.h2),
        Text('header 3', style: context.h3),
        Text('paragraph', style: context.p),
        const Divider(),
        Text('h1.bold', style: context.h1.bold),
        Text('h2.bold', style: context.h2.bold),
        Text('h3.bold', style: context.h3.bold),
        Text('p.bold', style: context.p.bold),
        const Divider(),
        Text('h1.italic', style: context.h1.italic),
        Text('h2.italic', style: context.h2.italic),
        Text('h3.italic', style: context.h3.italic),
        Text('p.italic', style: context.p.italic),
        const Divider(),
        Text('h1.bold/italic', style: context.h1.bold.italic),
        Text('h2.bold/italic', style: context.h2.bold.italic),
        Text('h3.bold/italic', style: context.h3.bold.italic),
        Text('p.bold/italic', style: context.p.bold.italic),
        const Divider(),
        Text('h1.underline', style: context.h1.underline),
        Text('h2.underline', style: context.h2.underline),
        Text('h3.underline', style: context.h3.underline),
        Text('p.underline', style: context.p.underline),
        const Divider(),
        Text('h1.lineThrough', style: context.h1.lineThrough),
        Text('h2.lineThrough', style: context.h2.lineThrough),
        Text('h3.lineThrough', style: context.h3.lineThrough),
        Text('p.lineThrough', style: context.p.lineThrough),
        const Divider(),
        Text('h1.wide', style: context.h1.wide),
        Text('h2.wide', style: context.h2.wide),
        Text('h3.wide', style: context.h3.wide),
        Text('p.wide', style: context.p.wide),
        const Divider(),
        Text('h1.tight', style: context.h1.tight),
        Text('h2.tight', style: context.h2.tight),
        Text('h3.tight', style: context.h3.tight),
        Text('p.tight', style: context.p.tight),
        const Divider(),
        Text('p.size3xl', style: context.p.xxxl),
        Text('p.size2xl', style: context.p.xxl),
        Text('p.sizeXl', style: context.p.xl),
        Text('p.sizeLg', style: context.p.lg),
        Text('p.sizeMd', style: context.p.md),
        Text('p.sizeSm', style: context.p.sm),
      ],
    );
  }
}

class ColorStyles extends StatelessWidget {
  const ColorStyles({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: [
        Text('h1.primary', style: context.h1.primary),
        Text('h1.primary', style: context.h1.primary),
        Text('h2.primary', style: context.h2.primary),
        Text('h3.primary', style: context.h3.primary),
        Text('p.primary', style: context.p.primary),
        const Divider(),
        Text('h1.secondary', style: context.h1.secondary),
        Text('h2.secondary', style: context.h2.secondary),
        Text('h3.secondary', style: context.h3.secondary),
        Text('p.secondary', style: context.p.secondary),
        const Divider(),
        Text('h1.tertiary', style: context.h1.tertiary),
        Text('h2.tertiary', style: context.h2.tertiary),
        Text('h3.tertiary', style: context.h3.tertiary),
        Text('p.tertiary', style: context.p.tertiary),
        const Divider(),
        Text('h1.error', style: context.h1.error),
        Text('h2.error', style: context.h2.error),
        Text('h3.error', style: context.h3.error),
        Text('p.error', style: context.p.error),
        const Divider(),
        Text('h1.onPrimary.bgPrimary', style: context.h1.onPrimary.bgPrimary),
        Text('h2.onPrimary.bgPrimary', style: context.h2.onPrimary.bgPrimary),
        Text('h3.onPrimary.bgPrimary', style: context.h3.onPrimary.bgPrimary),
        Text('p.onPrimary.bgPrimary', style: context.p.onPrimary.bgPrimary),
        const Divider(),
        Text('h1.onSecondary.bgSecondary',
            style: context.h1.onSecondary.bgSecondary),
        Text('h2.onSecondary.bgSecondary',
            style: context.h2.onSecondary.bgSecondary),
        Text('h3.onSecondary.bgSecondary',
            style: context.h3.onSecondary.bgSecondary),
        Text('p.onSecondary.bgSecondary',
            style: context.p.onSecondary.bgSecondary),
        const Divider(),
        Text('h1.onTertiary.bgTertiary',
            style: context.h1.onTertiary.bgTertiary),
        Text('h2.onTertiary.bgTertiary',
            style: context.h2.onTertiary.bgTertiary),
        Text('h3.onTertiary.bgTertiary',
            style: context.h3.onTertiary.bgTertiary),
        Text('p.onTertiary.bgTertiary', style: context.p.onTertiary.bgTertiary),
        const Divider(),
        Text('h1.onError.bgError', style: context.h1.onError.bgError),
        Text('h2.onError.bgError', style: context.h2.onError.bgError),
        Text('h3.onError.bgError', style: context.h3.onError.bgError),
        Text('p.onError.bgError', style: context.p.onError.bgError),
        const Divider(),
      ],
    );
  }
}
