import 'package:dart_mappable/dart_mappable.dart';
import 'package:fundwise/budget/budget_model.dart';
import 'package:fundwise/services/collection.dart';

part 'category_model.mapper.dart';

@MappableClass()
class CategoryModel with CategoryModelMappable, CollectionModel {
  CategoryModel({required this.id, required this.created, required this.updated});

  @override
  final String id;

  @override
  final DateTime created;

  @override
  final DateTime updated;
}

@MappableClass()
class CategoryGroupModel with CategoryGroupModelMappable, CollectionModel {
  CategoryGroupModel({
    required this.name,
    required this.budget,
    required this.id,
    required this.created,
    required this.updated,
    this.categories = const [],
  });

  final String name;
  final BudgetModel budget;
  final List<CategoryModel> categories;

  @override
  final String id;

  @override
  final DateTime created;

  @override
  final DateTime updated;
}
