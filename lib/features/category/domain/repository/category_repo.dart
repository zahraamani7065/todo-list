import 'package:todo_list_app/core/resorces/data_state.dart';
import 'package:todo_list_app/features/category/domain/entity/category_entity.dart';

import '../../../main/domain/entity/data_entity.dart';

abstract class CategoryRepository{

  Future<DataState<CategoryEntity>> insertCategory(CategoryEntity categoryEntity);
  Future<DataState<List<CategoryEntity>>> getCategory();

}