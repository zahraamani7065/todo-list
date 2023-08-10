import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_app/utils/images/svg_logos.dart';

import '../widgets/onboading_item.dart';

class OnboadingTwo extends StatelessWidget{
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
        title: "Create daily routine",
        imageSource: svgSourceOnBoadingTwo,
        index: 2,
        firstGuidance: "In Uptodo you can create your ",
        secondGuidance: "personalized routine to stay productive ",
      ),
    ));
  }
}