import 'package:hive/hive.dart';
import 'package:todo_list_app/core/resorces/data_state.dart';
import 'package:todo_list_app/features/category/domain/entity/category_entity.dart';
import 'package:todo_list_app/main.dart';

import '../../domain/repository/category_repo.dart';
import '../data_source/category_data.dart';

class CategoryRepositoryIml extends CategoryRepository {
  final box = Hive.box<CategoryData>(categoryBoxName);

  @override
  Future<DataState<CategoryEntity>> insertCategory(
      CategoryEntity categoryEntity) async {
    CategoryData categoryData = CategoryData.fromCategoryEntity(categoryEntity);
    await box.add(categoryData);
    return DataSuccess(categoryEntity);
  }

  @override
  Future<DataState<List<CategoryEntity>>> getCategory()async {
    List<CategoryData> data = box.values.toList();
    try {
      List<CategoryEntity> categories = data.map((category) =>
          CategoryEntity(categoryColorEntity: category.color,
              categoryNameEntity: category.name,
              categoryIconEntity: category.icon)).toList();
      return DataSuccess(categories);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}
