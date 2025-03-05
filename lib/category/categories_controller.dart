import 'package:fundwise/budget/budget_controller.dart';
import 'package:fundwise/category/categories_collection.dart';
import 'package:fundwise/category/category_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'categories_controller.g.dart';

@riverpod
class CategoriesController extends _$CategoriesController {
  @override
  Future<List<CategoryGroupModel>> build() async {
    final budgetId = ref.watch(currentBudgetProvider.select((budget) => budget?.id));
    final collection = ref.watch(categoriesCollectionProvider(budgetId ?? ''));
    final results = await collection.getFullList();
    return results;
  }
}
