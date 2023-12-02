import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

import '../../domain/entity/category_entity.dart';
part 'category_data.g.dart';

@HiveType(adapterName: 'CategoryDataAdapter',  typeId: 3)
class CategoryData {
  @HiveField(0)
  int color= Color(0xFF0000FF).value;

  @HiveField(1)
   String name="";

  @HiveField(2)
   String icon='';
  CategoryData(this.color, this.name, this.icon);
  CategoryData.fromCategoryEntity(CategoryEntity categoryEntity){
    color=categoryEntity.categoryColorEntity;
    name=categoryEntity.categoryNameEntity;
    icon=categoryEntity.categoryIconEntity;
  }


}
