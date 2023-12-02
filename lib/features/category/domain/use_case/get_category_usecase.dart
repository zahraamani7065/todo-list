import 'package:todo_list_app/core/resorces/data_state.dart';
import 'package:todo_list_app/core/usecase/use_case.dart';
import 'package:todo_list_app/features/category/domain/entity/category_entity.dart';
import 'package:todo_list_app/features/category/domain/repository/category_repo.dart';

class GetCategoryUseCase extends UseCase<DataState<List<CategoryEntity>>,void>{
  final CategoryRepository categoryRepository;

  GetCategoryUseCase(this.categoryRepository);

  @override
  Future<DataState<List<CategoryEntity>>> call(void params) {
    return  categoryRepository.getCategory();
  }

}