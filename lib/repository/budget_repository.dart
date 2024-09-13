import 'package:app/repository/budget_model.dart';
import 'package:app/repository/model_to_map.dart';
import 'package:pocketbase/pocketbase.dart';

class BudgetRepository {
  BudgetRepository({required PocketBase pb}) : _pb = pb;

  final PocketBase _pb;

  Future<BudgetSummaryModel?> getDefaultBudget() async {
    final model = _pb.authStore.model;
    if (model is! RecordModel) return null;
    try {
      final result = await _pb
          .collection('default_budgets_view')
          .getFirstListItem('owner="${model.id}"');

      final data = modelToMap(result);

      final budget = BudgetSummaryModelMapper.fromMap(data);
      return budget;
    } on ClientException {
      return null;
    }
  }

  Future<Iterable<BudgetSummaryModel>> getBudgets() async {
    final records = await _pb.collection('budget_summaries').getFullList();
    return records.map(modelToMap).map(BudgetSummaryModelMapper.fromMap);
  }

  Future<void> setDefault(BudgetSummaryModel budget) async {
    final model = _pb.authStore.model;
    if (model is! RecordModel) return;

    final body = {
      'budget': budget.id,
      'user': model.id,
    };

    await _pb.collection('default_budgets').create(body: body);
  }
}
