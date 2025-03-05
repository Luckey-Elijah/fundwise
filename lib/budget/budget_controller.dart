import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fundwise/budget/budget_model.dart';
import 'package:fundwise/budget/budgets_collection.dart';
import 'package:fundwise/services/pocketbase.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'budget_controller.g.dart';
part 'budget_controller.mapper.dart';

@MappableClass()
class UserModel with UserModelMappable {
  UserModel({required this.email, required this.created, required this.updated, required this.id});

  final String id;
  final String email;
  final DateTime created;
  final DateTime updated;
}

@riverpod
BudgetModel? currentBudget(Ref ref) {
  final value = ref.watch(
    budgetControllerProvider().select((value) {
      if (value case AsyncData(value: final BudgetModel budget)) return budget;
      return null;
    }),
  );
  return value;
}

@Riverpod(keepAlive: true)
class BudgetController extends _$BudgetController {
  @override
  Future<BaseBudgetModel> build([String? budgetId]) async {
    final collection = ref.watch(budgetsCollectionProvider);

    try {
      if (budgetId != null && budgetId.isNotEmpty) {
        final budget = await collection.getOne(budgetId);
        return budget;
      }
      final results = await collection.getList(sort: '-created', perPage: 1);
      final first = results.items.firstOrNull;
      if (first == null) return EmptyBudgetModel();
      return first;
    } on ClientException catch (e, s) {
      print(e);
      print(s);
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
