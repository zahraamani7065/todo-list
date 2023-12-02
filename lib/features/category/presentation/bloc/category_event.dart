part of 'category_bloc.dart';

@immutable
abstract class CategoryEvent {}
class AddCategoryEvent extends CategoryEvent{
  final CategoryEntity categoryEntity;

  AddCategoryEvent(this.categoryEntity);
}
class GetCategoryEvent extends CategoryEvent{}
