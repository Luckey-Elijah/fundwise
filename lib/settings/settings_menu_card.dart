import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fundwise/budget/budget_model.dart';
import 'package:fundwise/budget/budget_shell_page.dart';
import 'package:fundwise/root/router.dart';
import 'package:fundwise/services/auth.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class SettingsMenuCard extends ConsumerWidget {
  const SettingsMenuCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ShadTheme.of(context);
    final data = ref.watch(authenticationProvider);

    void onPressed() {
      context.navigateTo(const SettingsRoute());
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        const shadAvatar = ShadAvatar(
          'https://app.requestly.io/delay/2000'
          '/avatars.githubusercontent.com/u/124599?v=4',
        );

        if (constraints.maxWidth < 80) {
          return ShadIconButton.raw(
            onPressed: onPressed,
            icon: shadAvatar,
            variant: ShadButtonVariant.ghost,
            padding: const EdgeInsets.all(4),
          );
        }

        return ShadButton.raw(
          onPressed: onPressed,
          variant: ShadButtonVariant.ghost,
          height: 64,
          mainAxisAlignment: MainAxisAlignment.start,
          leading: shadAvatar,
          expands: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              const BudgetName(),
              Text(
                switch (data) {
                  AsyncData(value: final record) => record?.data['email']?.toString() ?? 'n/a',
                  _ => '/null',
                },
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.muted,
              ),
            ],
          ),
        );
      },
    );
  }
}

class BudgetName extends ConsumerWidget {
  const BudgetName({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ShadTheme.of(context);
    final state = ref.watch(budgetProvider);
    if (state case AsyncData(value: BudgetModel(:final name))) {
      return Text(
        name,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: theme.textTheme.large,
      );
    }
    return const SizedBox.shrink();
  }
}
