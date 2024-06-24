import 'package:app/repository/budget.model.dart';
import 'package:pocketbase/pocketbase.dart';

class BudgetRepository {
  BudgetRepository({required PocketBase pb}) : _pb = pb;

  final PocketBase _pb;

  Future<BudgetModel?> getDefaultBudget() async {
    final model = _pb.authStore.model;
    if (model is! RecordModel) return null;
    try {
      final record = await _pb
          .collection('default_budgets')
          .getFirstListItem('user=${model.id}');
      return BudgetModel.fromJson(record.data);
    } on ClientException {
      return null;
    }
  }

  Future<List<BudgetModel>> getBudgets() async {
    final records = await _pb.collection('budgets').getFullList();

    return [
      ...records.map((record) => record.data).map(BudgetModel.fromJson),
    ];
  }
}
