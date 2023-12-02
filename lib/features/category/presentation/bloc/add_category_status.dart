import 'package:equatable/equatable.dart';
import 'package:todo_list_app/features/category/domain/entity/category_entity.dart';

import '../../domain/use_case/add_category_usecase.dart';

abstract class AddCategoryStatus extends Equatable{}

class AddCategoryInitialState extends AddCategoryStatus {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}


class AddCategoryCompleteState extends AddCategoryStatus{
  final CategoryEntity categoryEntity;


  AddCategoryCompleteState(this.categoryEntity);

  @override
  // TODO: implement props
  List<Object?> get props => [categoryEntity];
}
class AddCategoryErrorState extends AddCategoryStatus{
  final String error;

  AddCategoryErrorState(this.error);

  @override
  // TODO: implement props
  List<Object?> get props => [error];

}