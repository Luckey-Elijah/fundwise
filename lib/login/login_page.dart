import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fundwise/components/coming_soon.dart';
import 'package:fundwise/root/router.dart';
import 'package:fundwise/services/auth.dart';
import 'package:fundwise/services/pocketbase.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

@RoutePage()
class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final username = TextEditingController();
  final password = TextEditingController();

  @override
  void dispose() {
    username.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final authWithPassword = ref.watch(
      pocketbaseProvider.select((pb) => pb.collection('users').authWithPassword),
    );

    ref.listen(authenticationProvider, (previous, next) {
      if (next is AsyncData) {
        ref.read(routerProvider).replace(BudgetRoute());
      }
    });

    return Center(
      child: AutofillGroup(
        child: ShadCard(
          width: 300,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Login', style: theme.textTheme.large),
              ShadInput(
                controller: username,
                placeholder: Text('username'),
                autofillHints: const [AutofillHints.email, AutofillHints.username],
              ),
              ShadInput(
                controller: password,
                placeholder: Text('password'),
                obscureText: true,
                autofillHints: const [AutofillHints.password],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ShadButton(
                    child: Text('Login'),
                    onPressed: () async {
                      await authWithPassword(username.text, password.text);
                    },
                  ),
                  ComingSoon(
                    feature: 'Register',
                    child: ShadButton(enabled: false, child: Text('Register')),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
