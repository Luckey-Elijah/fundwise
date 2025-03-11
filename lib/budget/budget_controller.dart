import 'package:fundwise/budget/budget_model.dart';
import 'package:fundwise/budget/budgets_collection.dart';
import 'package:fundwise/services/pocketbase.dart';
import 'package:fundwise/services/shared_preferences.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'budget_controller.g.dart';

@Riverpod(keepAlive: true)
class BudgetController extends _$BudgetController {
  static const key = 'defaultBudget';

  @override
  Future<BaseBudgetModel> build() async {
    listenSelf((previous, next) {
      if (next.valueOrNull case BudgetModel(:final id)) {
        ref.read(sharedPreferencesProvider).setString(key, id);
      } else if (next.valueOrNull is! BudgetModel) {
        ref.read(sharedPreferencesProvider).remove(key);
      }
    });

    final collection = ref.watch(budgetsCollectionProvider);
    try {
      // TODO(elijah): setup selected budget
      final budget = await collection.getOne('null');
      return budget;
    } on ClientException catch (_) {
      return EmptyBudgetModel();
    }
  }

  Future<void> createBudget(String name) async {
    final collection = ref.watch(budgetsCollectionProvider.select((col) => col.collection));
    final user = ref.read(pocketbaseProvider.select((pb) => pb.authStore.record?.id));
    await update((_) async {
      final result = await collection.create(body: {'name': name, 'admin': user});
      return BudgetModelMapper.fromMap(result.flattened);
    });
  }
}

extension on RecordModel {
  Map<String, dynamic>? get expand$ {
    if (data case {'expand': final Map<String, dynamic> expand}) {
      return expand;
    }
    return null;
  }

  Map<String, dynamic> get flattened => {...data, ...?expand$};
}
