import 'package:dart_mappable/dart_mappable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'budget_new.g.dart';
part 'budget_new.mapper.dart';

@MappableClass()
class BudgetNewModel with BudgetNewModelMappable {
  BudgetNewModel();
}

@riverpod
class BudgetNew extends _$BudgetNew {
  @override
  Future<BudgetNewModel> build() async {
    return BudgetNewModel();
  }

  Future<void> createBudget({required String name}) async {
    //
  }
}
