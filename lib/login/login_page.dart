import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fundwise/components/coming_soon.dart';
import 'package:fundwise/health/health.dart';
import 'package:fundwise/health/health_check.dart';
import 'package:fundwise/remember_username/remember_username.dart';
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
  late final username = TextEditingController()..addListener(onUsernameChange);
  final password = TextEditingController();

  void onUsernameChange() {
    if (ref.read(rememberUsernameProvider).value != null) {
      ref.read(rememberUsernameProvider.notifier).updateUsername(username.text);
    }
  }

  @override
  void dispose() {
    username
      ..removeListener(onUsernameChange)
      ..dispose();
    password.dispose();
    super.dispose();
  }

  Future<void> loginOnPressed() async {
    final authWithPassword = ref.read(
      pocketbaseProvider.select((pb) => pb.collection('users').authWithPassword),
    );
    await authWithPassword(username.text, password.text);
  }

  void checkboxOnChanged({required bool saveUserName}) {
    ref.read(rememberUsernameProvider.notifier).updateUsername(saveUserName ? username.text : null);
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    ref
      ..listen(authenticationProvider, (previous, next) {
        if (next is AsyncData) {
          context.replaceRoute(const BudgetShellRoute());
        }
      })
      ..listen(rememberUsernameProvider, (prev, next) {
        if (next case AsyncData(:final value?) when prev is! AsyncData) {
          username.text = value;
        }
      });

    return Stack(
      children: [
        const Align(alignment: AlignmentDirectional.bottomEnd, child: HealthCheckButton()),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: AutofillGroup(
                  child: ShadCard(
                    width: 300,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Login', style: theme.textTheme.large),
                        ShadInput(
                          controller: username,
                          placeholder: const Text('username'),
                          autofillHints: const [AutofillHints.email, AutofillHints.username],
                        ),
                        Row(
                          spacing: 4,
                          children: [
                            ShadCheckbox(
                              value: ref.watch(rememberUsernameProvider).value != null,
                              onChanged: (value) => checkboxOnChanged(saveUserName: value),
                            ),
                            Text('remember username', style: theme.textTheme.muted),
                          ],
                        ),
                        ShadInput(
                          controller: password,
                          placeholder: const Text('password'),
                          obscureText: true,
                          autofillHints: const [AutofillHints.password],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ShadButton(onPressed: loginOnPressed, child: const Text('Login')),
                            const ComingSoon(
                              feature: 'Register',
                              child: ShadButton(enabled: false, child: Text('Register')),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Flexible(child: BaseUrlInput()),
            ],
          ),
        ),
      ],
    );
  }
}

class BaseUrlInput extends ConsumerStatefulWidget {
  const BaseUrlInput({
    super.key,
  });

  @override
  ConsumerState<BaseUrlInput> createState() => _BaseUrlInputState();
}

class _BaseUrlInputState extends ConsumerState<BaseUrlInput> {
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    final initialUrl = ref.read(urlBaseProvider);
    controller.text = '$initialUrl';
    controller.addListener(() {
      final value = controller.text;
      ref.read(urlBaseProvider.notifier).update(value);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final healthy = ref.watch(
      healthProvider.select((health) => health.unwrapPrevious().value?.data != null),
    );
    return ShadCard(
      width: 300,
      child: ShadInput(
        decoration: ShadDecoration(
          border: ShadBorder.all(
            color: healthy ? null : ShadTheme.of(context).colorScheme.destructive,
          ),
        ),
        controller: controller,
        autofillHints: const [AutofillHints.url],
        placeholder: const Text('Url'),
        trailing: Icon(healthy ? LucideIcons.link : LucideIcons.unlink),
      ),
    );
  }
}
