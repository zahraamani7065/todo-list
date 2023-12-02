import 'package:equatable/equatable.dart';
import 'package:todo_list_app/features/main/presentation/%20block/get_task_status.dart';

import '../../domain/entity/category_entity.dart';

abstract class GetCategoryStatus extends Equatable{
}
class GetCategoryInitialState extends GetCategoryStatus{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class GetCategoryCompleteState extends GetCategoryStatus{

  final List<CategoryEntity> categoryEntities;


  GetCategoryCompleteState(this.categoryEntities);

  @override
  // TODO: implement props
  List<Object?> get props => [categoryEntities];
}

class  GetCategoryErrorState extends GetCategoryStatus{

  final String error;

  GetCategoryErrorState(this.error);

  @override
  // TODO: implement props
  List<Object?> get props =>[error];
}