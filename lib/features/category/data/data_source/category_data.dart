import 'dart:ui';

import 'package:hive/hive.dart';
part 'category_data.g.dart';

@HiveType(adapterName: 'CategoryDataAdapter',  typeId: 3)
class CategoryData {
  @HiveField(0)
  int color= Color(0xFF0000FF).value;

  @HiveField(1)
   String name="";

  @HiveField(2)
   String icon="";

  CategoryData(this.color, this.name, this.icon);


}
