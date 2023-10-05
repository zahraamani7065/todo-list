import 'package:equatable/equatable.dart';
import 'package:todo_list_app/features/category/domain/entity/category_entity.dart';

class DataEntity extends Equatable {
  final String name;
  final String description;
  bool iscompleted;
  final DateTime dateTime;
  final CategoryEntity category;
  final int proirity;

  DataEntity(
      {
      required this.name,
      required this.description,
      required this.iscompleted,
      required this.dateTime,
      required this.category,
      required this.proirity});

  @override
  // TODO: implement props
  List<Object?> get props =>
      [name, description, iscompleted, dateTime, category, proirity];
}
