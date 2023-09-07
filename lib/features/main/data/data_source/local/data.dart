import 'dart:ui';

import 'package:hive/hive.dart';
import 'package:todo_list_app/features/category/data/data_source/category_data.dart';

import '../../../../category/data/data_source/category_data.dart';
import '../../../../category/data/data_source/category_data.dart';
import '../../../../category/data/data_source/category_data.dart';
import '../../../../category/data/data_source/category_data.dart';
import '../../../../category/data/data_source/category_data.dart';
import '../../../../category/data/data_source/category_data.dart';

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
  CategoryData category = CategoryData(Color(0xFFFFFF),"","");

  Task(this.name, this.isComleted, this.proirity, this.dateTime,
      this.description, this.category);
}
class NoParams{}


