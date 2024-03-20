import 'package:app/routes.dart' as app;
import 'package:app/theme_extension/theme.dart';
import 'package:app/utility/build_context.extension.dart';
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
            decoration: context.decorationTheme.primary,
            child: ConstrainedBox(
              constraints: context.decorationTheme.smallWidth,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () => context
                              .pushReplacementNamed(app.Routes.dashboard.path),
                          child: const Text('login'),
                        ),
                        TextButton(
                          onPressed: () => context
                              .pushReplacementNamed(app.Routes.register.path),
                          child: const Text('register'),
                        ),
                      ],
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
