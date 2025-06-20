import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fundwise/budget/budget_model.dart';
import 'package:fundwise/root/router.dart';
import 'package:fundwise/services/collection.dart';
import 'package:fundwise/services/pocketbase.dart';
import 'package:fundwise/services/shared_preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

part 'budget_shell_page.g.dart';

@Riverpod(keepAlive: true)
Future<BaseBudgetModel> budget(Ref ref) async {
  final sharedPref = ref.watch(sharedPreferencesProvider);
  final maybeBudget = sharedPref.getString('default-budget');
  final collection = ref
      .watch(pocketbaseProvider)
      .collection('budgets')
      .toCollection(BudgetModelMapper.ensureInitialized(), expand: ['admin']);

  if (maybeBudget != null) {
    final budget = await collection.getOne(maybeBudget);
    return budget;
  }

  final fromPb = collection.getList(sort: '-updated', perPage: 1);
  final results = await fromPb;
  final id = results.items.firstOrNull?.id;

  if (id != null) {
    await sharedPref.setString('default-budget', id);
    final budget = await collection.getOne(id);
    return budget;
  }

  return EmptyBudgetModel();
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
    ref.listen(budgetProvider, (prev, next) {
      if (next case AsyncData(value: BudgetModel(:final id))) {
        context.navigateTo(BudgetDetailRoute(id: id));
      }
    });

    final theme = ShadTheme.of(context);

    return Center(
      child: Column(
        children: [
          Flexible(
            child: Text('${ref.watch(budgetProvider)}', style: theme.textTheme.list),
          ),
          const ShadProgress(),
        ],
      ),
    );
  }
}

bool someBool = true;

Map<String, String> map = <String, String>{
  if (someBool)
    'title': 'Currently showing subset'
  else
    'title': 'Currently showing all notifications',
};
