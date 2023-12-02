import 'package:todo_list_app/core/resorces/data_state.dart';
import 'package:todo_list_app/core/usecase/use_case.dart';
import 'package:todo_list_app/features/category/domain/entity/category_entity.dart';
import 'package:todo_list_app/features/category/domain/repository/category_repo.dart';

class AddCategoryUseCase extends UseCase<void,CategoryEntity>{
  CategoryRepository categoryRepository;


  AddCategoryUseCase({required this.categoryRepository});

  @override
  Future<DataState<CategoryEntity>> call(CategoryEntity params) {
    return categoryRepository.insertCategory(params);

  }

}