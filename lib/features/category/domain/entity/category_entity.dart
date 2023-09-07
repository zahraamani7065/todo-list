import 'package:equatable/equatable.dart';
import 'package:todo_list_app/features/category/domain/entity/category_color_entity.dart';
import 'package:todo_list_app/features/category/domain/entity/category_icon_entity.dart';
import 'package:todo_list_app/features/category/domain/entity/category_name_entity.dart';

class CategoryEntity extends Equatable{
  final String categoryNameEntity;
  final String categoryColorEntity;
    final String categoryIconEntity;


  CategoryEntity({ required this.categoryNameEntity, required this.categoryColorEntity,
      required this.categoryIconEntity});

  @override
  // TODO: implement props
  List<Object?> get props => [categoryIconEntity,categoryColorEntity,categoryNameEntity];

}