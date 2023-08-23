import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../home/data/local/data.dart';

class description extends StatelessWidget {
  const description({
    super.key,
    required this.task,
    required this.textTheme,
  });

  final Task task;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment
              .start,
          children: [
            Text(
              task.description,
              maxLines: 1,
              overflow: TextOverflow.fade,
              style: textTheme.bodyText2,
            ),
            const SizedBox(
              height: 4,
            ),
            Row(children: [
              Text(task.dateTime.year
                  .toString(),
                style: textTheme.headline1,),
              Text(".",
                  style: textTheme.headline1),
              Text(task.dateTime.month
                  .toString(),
                style: textTheme.headline1,),
              Text(".",
                  style: textTheme.headline1),
              Text(task.dateTime.day
                  .toString(),
                  style: textTheme.headline1),
              Text(" at ",
                  style: textTheme.headline1),
              Text(task.dateTime.hour
                  .toString(),
                  style: textTheme.headline1),
              Text(":",
                  style: textTheme.headline1),
              Text(task.dateTime.minute
                  .toString(),
                  style: textTheme.headline1),
            ]),
          ]),
    );
  }
}
