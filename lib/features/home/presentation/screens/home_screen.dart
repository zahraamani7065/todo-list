import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list_app/features/home/data/local/data.dart';
import 'package:todo_list_app/features/home/presentation/widgets/check_box.dart';
import 'package:todo_list_app/main.dart';
import '../../../add_task/presentation/widgets/items_description.dart';
import '../../../add_task/presentation/widgets/priority.dart';
import '../widgets/emptyState.dart';
import '../widgets/searchBox.dart';



Color getRandomColor() {
  Random random = Random();
  return Color.fromARGB(
    255,
    random.nextInt(256),
    random.nextInt(256),
    random.nextInt(256),
  );
}
class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final box = Hive.box<Task>(taskBoxName);
    final themeColor = Theme.of(context);
    final width = MediaQuery
        .of(context)
        .size
        .width;
    final height = MediaQuery
        .of(context)
        .size
        .height;
    final textTheme = Theme
        .of(context)
        .textTheme;
    final localization = AppLocalizations.of(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: themeColor.backgroundColor,
            body:
             ValueListenableBuilder<Box<Task>>(
                valueListenable: box.listenable(),
                builder: (BuildContext context, box, Widget? child) {
                  return
                    Padding(
                    padding: const EdgeInsets.all(20),
                    child: box.isEmpty
                        ? EmptyState(
                        localization: localization,
                        textTheme: textTheme,
                        width: width,
                        height: height)
                        :
                    Column(
                      children: [
                        SearchBox(
                            height: height,
                            themeColor: themeColor,
                            localization: localization),
                        SizedBox(
                          height: height / 30,
                        ),

                           Expanded(
                            child:Column(
                                children: [ ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection:Axis.vertical ,
                                    itemCount: box.values.length,
                                    itemBuilder: (context, index) {
                                      final Task task =
                                      box.values.toList()[index];
                                      return
                                        Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: themeColor
                                                        .colorScheme.onBackground),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Row(
                                              children: [
                                                MyCheckBox(
                                                  value: task.isComleted,
                                                  onTap: () {
                                                    setState(() {
                                                      task.isComleted =
                                                      !task.isComleted;
                                                    });
                                                  },
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                description(task: task, textTheme: textTheme),
                                                SizedBox(width: width / 20,),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 15),
                                                  child: Container(
                                                    height: height / 25,
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius
                                                            .circular(5),
                                                        color: getRandomColor()
                                                    ),
                                                    child: Padding(
                                                        padding: const EdgeInsets.all(4),
                                                        child: Center(child: Text(
                                                            task.category.name
                                                                .toString()))),
                                                  ),
                                                ),
                                                SizedBox(width: 5,),
                                                priority(height: height, themeColor: themeColor, task: task),

                                                //
                                                // InkWell(
                                                //     onTap: (){
                                                //       setState(() {
                                                //         box.clear();
                                                //       });
                                                //
                                                //     },
                                                //     child: Icon(Icons.access_alarm,))
                                              ],
                                            ),
                                          ),
                                        ),
                                        );
                                    }),
                             ] ),

                          ),

                      ],
                    ),
                        );
                },
              ),
            ));
  }
}





