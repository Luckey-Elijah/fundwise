import 'package:app/theme_extension/decoration.dart';
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
            decoration: context.decorationTheme.primary,
            child: ConstrainedBox(
              constraints: context.decorationTheme.smallWidth,
              child: const Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [CircularProgressIndicator.adaptive()],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
