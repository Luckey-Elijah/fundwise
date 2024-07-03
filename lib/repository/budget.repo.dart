import 'package:app/repository/budget.model.dart';
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

      final budget = BudgetSummaryModel.fromJson(forModel(result));
      return budget;
    } on ClientException {
      return null;
    }
  }

  Future<List<BudgetSummaryModel>> getBudgets() async {
    final records = await _pb.collection('budgets_view').getFullList();

    final budgets = [...records.map(forModel).map(BudgetSummaryModel.fromJson)];
    return budgets;
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

Map<String, dynamic> forModel(RecordModel model) => {
      ...model.data,
      'id': model.id,
      'created': model.created,
      'updated': model.updated,
    };
