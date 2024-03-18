import 'package:app/theme_extension/theme.dart';
import 'package:app/utility/build_context.extension.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: DecoratedBox(
            decoration: context.decorationTheme.primary,
            child: ConstrainedBox(
              constraints: context.decorationTheme.mediumWidth,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const TextField(
                      decoration: InputDecoration(hintText: 'username'),
                      autofillHints: [AutofillHints.newUsername],
                    ),
                    context.marginTheme.small.box,
                    const TextField(
                      decoration: InputDecoration(hintText: 'password'),
                      obscureText: true,
                      autofillHints: [AutofillHints.newPassword],
                    ),
                    context.marginTheme.small.box,
                    const TextField(
                      decoration: InputDecoration(hintText: 'confirm password'),
                      obscureText: true,
                      autofillHints: [AutofillHints.newPassword],
                    ),
                    context.marginTheme.small.box,
                    TextButton(
                      onPressed: () => context.pushReplacementNamed('/login'),
                      child: const Text('register'),
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
