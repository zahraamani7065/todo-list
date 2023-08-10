import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_app/utils/images/svg_logos.dart';

import '../widgets/onboading_item.dart';

class OnBoadingthree extends StatelessWidget {
  const OnBoadingthree({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      body: OnboadingItemsWidget(
        height: height,
        width: width,
        title: "Orgonaize your tasks",
        imageSource: svgSourceOnBoadingThree,
        index: 3,
        firstGuidance: "You can organize your daily tasks by ",
        secondGuidance: "adding your tasks into separate categories ",
      ),
    ));
  }
}
