import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_app/features/intro/presentation/screens/onboading_one.dart';
import 'package:todo_list_app/features/intro/presentation/screens/onboading_three.dart';
import 'package:todo_list_app/features/intro/presentation/screens/startScreen.dart';

import '../screens/onboading_two.dart';

class MainWrapper extends StatelessWidget {
  MainWrapper({Key? key}) : super(key: key);
  final PageController pageController=PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    List<Widget> pageViewWidget=[
      OnboadingOne(),
      OnboadingTwo(),
      OnBoadingthree(),
      StartScreen(),

    ];
    return Scaffold(
      backgroundColor:Theme.of(context).backgroundColor,
      extendBody: true,
      body: Container(
        child: PageView(
          controller:pageController ,
          children: pageViewWidget,
        ),
      ),
    );

  }
}
