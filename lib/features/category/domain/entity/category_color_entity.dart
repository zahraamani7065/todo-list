import 'package:equatable/equatable.dart';

class CategoryColorEntity extends Equatable{

  final String red;
  final String blue;
  final String green;
  final String yellow;
  final String orange;
  final String purple;
  final String black;
  final String pink;
  final String teal;


  CategoryColorEntity({ required this.red, required this.blue, required this.green, required this.yellow, required this.orange,
      required this.purple, required this.black, required this.pink, required this.teal});

  @override
  // TODO: implement props
  List<Object?> get props => [red,blue,green,yellow,orange,purple,black,pink,teal];

}