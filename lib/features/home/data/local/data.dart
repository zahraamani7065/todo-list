import 'package:hive/hive.dart';
part 'data.g.dart';



@HiveType(typeId:0)
class Task extends HiveObject{

  @HiveField(0)
  String name='';

  @HiveField(1)
  bool isComleted=false;

  @HiveField(2)
  int proirity=1;

  @HiveField(3)
  DateTime dateTime=DateTime.now();

  @HiveField(4)
  String description='';

  @HiveField(5)
  Category category=Category.work;

}


@HiveType(typeId: 2)
enum Category{
  @HiveField(0)
  Home,

  @HiveField(1)
  university,

  @HiveField(2)
  work,

  @HiveField(3)
  sport,

  @HiveField(4)
  Music,

  @HiveField(5)
  health,

}