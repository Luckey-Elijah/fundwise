import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fundwise/budget/budget_controller.dart';
import 'package:fundwise/root/router.dart';
import 'package:fundwise/services/pocketbase.dart';
import 'package:fundwise/services/shared_preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

part 'budget_shell_page.g.dart';

@riverpod
Future<String?> defaultBudget(Ref ref) async {
  final sharedPref = ref.watch(sharedPreferencesProvider);
  final maybeBudget = sharedPref.getString(BudgetController.key);
  final fromPb = ref
      .watch(pocketbaseProvider)
      .collection('budgets')
      .getList(sort: '-updated', perPage: 1);
  if (maybeBudget != null) return maybeBudget;
  final results = await fromPb;
  final id = results.items.firstOrNull?.id;
  if (id != null) await sharedPref.setString(BudgetController.key, id);
  return id;
}

@RoutePage()
class BudgetShellPage extends ConsumerStatefulWidget {
  const BudgetShellPage({super.key});

  @override
  ConsumerState<BudgetShellPage> createState() => _BudgetShellPageState();
}

class _BudgetShellPageState extends ConsumerState<BudgetShellPage> {
  @override
  Widget build(BuildContext context) {
    ref.listen(defaultBudgetProvider, (prev, next) {
      if (next case AsyncData(:final value?)) {
        context.replaceRoute(BudgetDetailRoute(id: value));
      } else if (next is! AsyncLoading) {
        context.replaceRoute(BudgetNewRoute());
      }
    });

    final theme = ShadTheme.of(context);

    return Center(
      child: Column(
        children: [
          Text('${ref.watch(defaultBudgetProvider).valueOrNull}', style: theme.textTheme.large),
          ShadProgress(),
        ],
      ),
    );
  }
}
