import 'dart:ui';

import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable{
  final int categoryColorEntity;
  final String categoryNameEntity;
  final String categoryIconEntity;


  CategoryEntity({ required this.categoryColorEntity, required this.categoryNameEntity,
      required this.categoryIconEntity});

  @override
  // TODO: implement props
  List<Object?> get props => [categoryColorEntity,categoryIconEntity,categoryNameEntity];

}