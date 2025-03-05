import 'package:dart_mappable/dart_mappable.dart';
import 'package:fundwise/budget/budget_controller.dart';
import 'package:fundwise/services/collection.dart';

part 'budget_model.mapper.dart';

@MappableClass(discriminatorKey: 'type', includeSubClasses: [EmptyBudgetModel, BudgetModel])
sealed class BaseBudgetModel with BaseBudgetModelMappable {}

@MappableClass(discriminatorKey: 'empty')
class EmptyBudgetModel extends BaseBudgetModel with EmptyBudgetModelMappable {}

@MappableClass()
class BudgetModel extends BaseBudgetModel with BudgetModelMappable, CollectionModel {
  BudgetModel({
    required this.id,
    required this.name,
    required this.admin,
    required this.created,
    required this.updated,
  });

  final String name;

  final UserModel admin;

  @override
  final String id;

  @override
  final DateTime created;

  @override
  final DateTime updated;
}
