import 'dart:ui';

import 'package:hive/hive.dart';
part 'category_data.g.dart';

@HiveType(adapterName: 'CategoryDataAdapter',  typeId: 3)
class CategoryData {
   Color color=Color(0xFF0000FF);
   String name="";
   String icon="";

  CategoryData(this.color, this.name, this.icon);


}
