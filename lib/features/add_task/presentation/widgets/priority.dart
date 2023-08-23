import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../home/data/local/data.dart';

class priority extends StatelessWidget {
  const priority({
    super.key,
    required this.height,
    required this.themeColor,
    required this.task,
  });

  final double height;
  final ThemeData themeColor;
  final Task task;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Container(
        height: height / 25,
        decoration: BoxDecoration(
            borderRadius: BorderRadius
                .circular(5),
            color: themeColor.colorScheme.onBackground,
            border: Border.all(
                color: themeColor.primaryColor
            )
        ) ,
        child: Padding(
            padding: const EdgeInsets.all(4),
            child: Center(
              child: Row(
                children: [
                  const Icon(CupertinoIcons.flag),
                  const SizedBox(width: 3,),

                  Text(task.proirity.toString())
                ],
              ),
            )),
      ),
    );
  }
}