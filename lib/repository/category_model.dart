import 'package:dart_mappable/dart_mappable.dart';

part 'category_model.mapper.dart';

@MappableClass()
class CategoryModel with CategoryModelMappable {
  const CategoryModel({
    required this.id,
    required this.name,
    required this.hidden,
  });

  final String id;
  final String name;
  final bool hidden;
}

@MappableClass()
class CategoryGroupModel with CategoryGroupModelMappable {
  const CategoryGroupModel({
    required this.id,
    required this.name,
    required this.hidden,
    required this.categories,
  });

  final String id;
  final String name;
  final bool hidden;
  final List<CategoryModel> categories;
}
