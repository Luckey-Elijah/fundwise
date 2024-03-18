import 'package:app/build_context.extension.dart';
import 'package:app/theme/theme.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const TextField(
                      decoration: InputDecoration(hintText: 'username'),
                      autofillHints: [AutofillHints.username],
                    ),
                    context.marginTheme.small.box,
                    const TextField(
                      decoration: InputDecoration(hintText: 'password'),
                      obscureText: true,
                      autofillHints: [AutofillHints.password],
                    ),
                    context.marginTheme.small.box,
                    TextButton(
                      onPressed: () => context.pushReplacementNamed('/'),
                      child: const Text('login'),
                    ),
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
