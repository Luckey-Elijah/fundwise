import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fundwise/budget/budget_controller.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

@RoutePage()
class BudgetPage extends ConsumerWidget {
  const BudgetPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(budgetControllerProvider);

    if (state case AsyncData(:final value)) {
      return switch (value) {
        EmptyBudgetModel() => NewBudgetPage(),
        BudgetModel() => Placeholder(),
      };
    }

    return ShadProgress();
  }
}

class NewBudgetPage extends ConsumerStatefulWidget {
  const NewBudgetPage({super.key});

  @override
  ConsumerState<NewBudgetPage> createState() => _NewBudgetPageState();
}

class _NewBudgetPageState extends ConsumerState<NewBudgetPage> {
  final controller = TextEditingController();
  final $ready = ValueNotifier(true);
  late final $notify = Listenable.merge([controller, $ready]);
  @override
  void dispose() {
    controller.dispose();
    $ready.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ShadCard(
        width: 250,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('New Budget', style: ShadTheme.of(context).textTheme.large),
            ShadInput(placeholder: Text('Budget Name'), controller: controller),
            ListenableBuilder(
              listenable: $notify,
              builder:
                  (_, child) => ShadButton(
                    enabled: controller.text.isNotEmpty && $ready.value,
                    onPressed: () async {
                      $ready.value = false;
                      try {
                        await ref
                            .read(budgetControllerProvider.notifier)
                            .createBudget(controller.text);
                      } finally {
                        $ready.value = true;
                      }
                    },
                    child: Text('Create'),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
