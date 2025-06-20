import 'package:fundwise/category/category_model.dart';
import 'package:fundwise/services/collection.dart';
import 'package:fundwise/services/pocketbase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'categories_collection.g.dart';

@riverpod
Collection<CategoryGroupModel> categoriesCollection(Ref ref, String budget) {
  final pb = ref.watch(pocketbaseProvider);
  return Collection(
    pb.collection('category_groups'),
    mapper: CategoryGroupModelMapper.ensureInitialized(),
    expand: ['budget', 'categories'],
  );
}
