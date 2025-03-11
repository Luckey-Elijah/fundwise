import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fundwise/budget_new/budget_new.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class BudgetNewView extends ConsumerStatefulWidget {
  const BudgetNewView({super.key});

  @override
  ConsumerState<BudgetNewView> createState() => _BudgetNewViewState();
}

class _BudgetNewViewState extends ConsumerState<BudgetNewView> {
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.read(budgetNewProvider);
    return Center(
      child: ShadCard(
        width: 250,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('New Budget', style: ShadTheme.of(context).textTheme.large),
            ShadInput(placeholder: Text('Budget Name'), controller: controller),
            ShadButton(
              enabled: controller.text.isNotEmpty && !state.isLoading,
              onPressed:
                  () => ref
                      .read(budgetNewProvider.notifier)
                      .createBudget(name: controller.text),
              child: Text('Create'),
            ),
          ],
        ),
      ),
    );
  }
}
