import 'package:app/theme_extension/theme.dart';
import 'package:app/utility/build_context.extension.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () => context.mounted ? context.pushReplacementNamed('/register') : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: DecoratedBox(
            decoration: context.boxDecorationTheme.boxDecoration,
            child: ConstrainedBox(
              constraints: BoxConstraints.loose(const Size.fromWidth(300)),
              child: const Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator.adaptive(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
