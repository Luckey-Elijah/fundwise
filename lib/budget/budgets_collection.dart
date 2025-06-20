import 'package:fundwise/budget/budget_model.dart';
import 'package:fundwise/services/collection.dart';
import 'package:fundwise/services/pocketbase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'budgets_collection.g.dart';

@riverpod
Collection<BudgetModel> budgetsCollection(Ref ref) {
  final pb = ref.watch(pocketbaseProvider);
  return Collection(
    pb.collection('budgets'),
    mapper: BudgetModelMapper.ensureInitialized(),
    expand: ['admin'],
  );
}
