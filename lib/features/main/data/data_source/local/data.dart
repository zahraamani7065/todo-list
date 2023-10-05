import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:todo_list_app/features/category/data/data_source/category_data.dart';
import 'package:todo_list_app/features/category/domain/entity/category_entity.dart';

import '../../../../category/data/data_source/category_data.dart';
import '../../../../category/data/data_source/category_data.dart';
import '../../../../category/data/data_source/category_data.dart';
import '../../../../category/data/data_source/category_data.dart';
import '../../../../category/data/data_source/category_data.dart';
import '../../../../category/data/data_source/category_data.dart';
import '../../../domain/entity/data_entity.dart';

part 'data.g.dart';

@HiveType(adapterName: 'TaskAdapter', typeId: 0)
class Task {
  @HiveField(0)
  String name = '';

  @HiveField(1)
  bool isComleted = false;

  @HiveField(2)
  int proirity = 1;

  @HiveField(3)
  DateTime dateTime = DateTime.now();

  @HiveField(4)
  String description = '';

  @HiveField(5)
  CategoryData category = CategoryData(Color(0xFFFFFF).value,'', '');

  Task( this.name, this.isComleted, this.proirity, this.dateTime,
      this.description, this.category);


  CategoryData convertCategoryEntityToCategory(CategoryEntity categoryEntity) {
    return CategoryData(
        categoryEntity.categoryColorEntity ,
       categoryEntity.categoryNameEntity ,
       categoryEntity.categoryIconEntity,
    );
  }

  // Constructor to create a Task from a DataEntity
  Task.fromDataEntity(DataEntity dataEntity) {
    name = dataEntity.name;
    isComleted = dataEntity.iscompleted;
    proirity = dataEntity.proirity;
    dateTime = dataEntity.dateTime;
    description = dataEntity.description;
    category = convertCategoryEntityToCategory(dataEntity.category);
  }
}
class NoParams{}


