

import 'package:equatable/equatable.dart';

class CategoryIconEntity extends Equatable{
  final String home;
  final String music;
  final String movie;
  final String grocery;
  final String sport;
  final String university;
  final String social;
  final String createNew;
  final String work;


  const CategoryIconEntity({ required this.home, required this.music, required this.movie, required this.grocery,
      required this.sport, required this.university, required this.social, required this.createNew, required this.work});

  @override
  // TODO: implement props
  List<Object?> get props =>[home,music,movie,grocery,sport,university,social,createNew,work];

}