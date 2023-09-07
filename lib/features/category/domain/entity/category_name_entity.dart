
import 'package:equatable/equatable.dart';

class CategoryNameEntity extends Equatable{

  final String home;
  final String university;
  final String work;
  final String sport;
  final String music;
  final String health;


  const CategoryNameEntity({ required this.home, required this.university, required this.work, required this.sport,
      required this.music, required this.health});

  @override
  // TODO: implement props
  List<Object?> get props => [home,university,work,sport,music,health];

}