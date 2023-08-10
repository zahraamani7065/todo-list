import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_list_app/features/intro/presentation/screens/introduction_screen.dart';
import 'package:todo_list_app/features/intro/presentation/screens/onboading_two.dart';
import 'package:todo_list_app/features/intro/presentation/widgets/onboading_item.dart';

import '../../../../utils/images/svg_logos.dart';

class OnboadingOne extends StatelessWidget {
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
        title: "Manage your task",
        imageSource: svgSourceOnBoadingOne,
        index: 1,
        firstGuidance: " You can easily manage all of your daily ",
        secondGuidance: " tasks in DoMe for free ",
      ),
    ));
  }
}
