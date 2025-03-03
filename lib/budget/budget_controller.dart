import 'package:dart_mappable/dart_mappable.dart';
import 'package:fundwise/services/caching_mapper.dart';
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

@MappableClass(discriminatorKey: 'type', includeSubClasses: [EmptyBudgetModel, BudgetModel])
sealed class BaseBudgetModel with BaseBudgetModelMappable {
  const BaseBudgetModel();
}

@MappableClass(discriminatorKey: 'empty')
class EmptyBudgetModel extends BaseBudgetModel with EmptyBudgetModelMappable {
  const EmptyBudgetModel();
}

@MappableClass()
class BudgetModel extends BaseBudgetModel with BudgetModelMappable {
  const BudgetModel({
    required this.id,
    required this.name,
    required this.admin,
    required this.created,
    required this.updated,
  });

  final String id;
  final String name;
  final UserModel admin;
  final DateTime created;
  final DateTime updated;
}

@riverpod
class BudgetController extends _$BudgetController with CachedAsyncNotifierState<BaseBudgetModel> {
  @override
  Future<BaseBudgetModel> build() async {
    final budgetsCollection = ref.watch(
      pocketbaseProvider.select((pb) => pb.collection('budgets')),
    );

    final user = ref.watch(pocketbaseProvider.select((pb) => pb.authStore.record?.id));

    try {
      final result_ = await budgetsCollection.getList(
        expand: 'admin',
        sort: '-created',
        perPage: 1,
      );
      final value = BudgetModelMapper.fromMap(result_.items.first.flattened);
      return value;
    } on ClientException catch (e, s) {
      return EmptyBudgetModel();
    }
  }

  bool _storeWhen(AsyncValue<BaseBudgetModel>? previous, AsyncValue<BaseBudgetModel> next) {
    if (next case AsyncData(:final value)) return value is BudgetModel;
    return false;
  }

  @override
  ClassMapperBase<BaseBudgetModel> mapper() => BaseBudgetModelMapper.ensureInitialized();

  Future<void> createBudget(String name) async {
    final budgetsCollection = ref.read(pocketbaseProvider.select((pb) => pb.collection('budgets')));
    final user = ref.read(pocketbaseProvider.select((pb) => pb.authStore.record?.id));

    await update((_) async {
      final result = await budgetsCollection.create(
        body: {'name': name, 'admin': user},
        expand: 'admin',
      );
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
