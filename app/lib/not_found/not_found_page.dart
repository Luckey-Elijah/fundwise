import 'package:app/main.dart';
import 'package:app/theme_extension/theme.dart';
import 'package:app/utility/build_context.extension.dart';
import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: context.decorationTheme.smallWidth,
          child: DecoratedBox(
            decoration: context.decorationTheme.primary,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Oops!',
                    style: context.textTheme.headlineLarge,
                    textAlign: TextAlign.center,
                  ),
                  context.marginTheme.medium.box,
                  const Text(
                    'Looks Like you tried to navigate '
                    'to a non-existent page.',
                    textAlign: TextAlign.center,
                  ),
                  context.marginTheme.medium.box,
                  Text(
                    '${context.routeName}',
                    textAlign: TextAlign.center,
                  ),
                  context.marginTheme.medium.box,
                  const Text(
                    'Try going back to one of the available pages below.',
                    textAlign: TextAlign.center,
                  ),
                  context.marginTheme.medium.box,
                  Wrap(
                    children: [
                      TextButton.icon(
                        onPressed: () => context.pushReplacementNamed(
                          ApplicationRoutes.login.path,
                        ),
                        icon: const Icon(Icons.login_rounded),
                        label: const Text('Login'),
                      ),
                      TextButton.icon(
                        onPressed: () => context.pushReplacementNamed(
                          ApplicationRoutes.dashboard.path,
                        ),
                        icon: const Icon(Icons.wallet_rounded),
                        label: const Text('Budget'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
