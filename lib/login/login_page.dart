import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fundwise/components/coming_soon.dart';
import 'package:fundwise/health/health_check.dart';
import 'package:fundwise/remember_username/remember_username.dart';
import 'package:fundwise/root/router.dart';
import 'package:fundwise/services/auth.dart';
import 'package:fundwise/services/pocketbase.dart';
import 'package:mesh/mesh.dart';
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
    if (ref.read(rememberUsernameProvider).valueOrNull != null) {
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

  void checkboxOnChanged(bool value) {
    if (value) {
      ref.read(rememberUsernameProvider.notifier).updateUsername(username.text);
    } else {
      ref.read(rememberUsernameProvider.notifier).updateUsername(null);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    ref.listen(authenticationProvider, (previous, next) {
      if (next is AsyncData) {
        context.replaceRoute(BudgetShellRoute());
      }
    });

    ref.listen(rememberUsernameProvider, (prev, next) {
      if (next case AsyncData(:final value?) when prev is! AsyncData) {
        username.text = value;
      }
    });

    return Stack(
      children: [
        Positioned.fill(child: _Background()),
        Align(alignment: AlignmentDirectional.bottomEnd, child: HealthCheckButton()),
        Center(
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
                  Row(
                    spacing: 4,
                    children: [
                      ShadCheckbox(
                        value: ref.watch(rememberUsernameProvider).valueOrNull != null,
                        onChanged: checkboxOnChanged,
                      ),
                      Text('remember username', style: theme.textTheme.muted),
                    ],
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
                      ShadButton(onPressed: loginOnPressed, child: Text('Login')),
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
        ),
      ],
    );
  }
}

class _Background extends StatelessWidget {
  const _Background();

  @override
  Widget build(BuildContext context) {
    final colors = ShadTheme.of(context).colorScheme;
    final primary = colors.primary;

    return OMeshGradient(
      mesh: OMeshRect(
        width: 3,
        height: 3,
        vertices: [
          (-0.06, -0.08).v, (00.58, -0.05).v, (01.36, 00.04).v, //
          (-0.02, 00.31).v, (00.44, 00.63).v, (01.11, 00.4).v, //
          (-0.01, 01.01).v, (01.01, 01.00).v, (01.02, 00.73).v, //
        ],
        colors: [
          primary, Color(0xff4693a9), Color(0xff4693a9), // Row 1
          primary.withValues(blue: 128, red: 188),
          colors.background.withBlue(240),
          Color(0xff4693a9), // Row 2
          Color(0xff9715a9), Color(0xff4693a9), Color(0xff4693a9), // Row 3
        ],
      ),
    );
  }
}
