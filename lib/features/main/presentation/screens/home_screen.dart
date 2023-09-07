import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/features/main/domain/entity/data_entity.dart';
import 'package:todo_list_app/features/main/domain/repository/data_repository.dart';
import 'package:todo_list_app/features/main/presentation/%20block/get_task_status.dart';
import 'package:todo_list_app/features/main/presentation/%20block/task_list_bloc.dart';
import 'package:todo_list_app/main.dart';
import '../../../../locator.dart';
import '../../data/data_source/local/data.dart';
import '../widgets/items_description.dart';
import '../widgets/priority.dart';
import '../widgets/check_box.dart';
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
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<TaskListBloc>(context).add(GetAllDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    // final box = Hive.box<Task>(taskBoxName);
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
    return

      SafeArea(
        child: Scaffold(
            backgroundColor: themeColor.backgroundColor,
            body:BlocBuilder<TaskListBloc, TaskListState>(

                  buildWhen: (previous, current) {
                    if (current.getAllDataStatus == previous.getAllDataStatus) {
                      return false;
                    }
                    return true;
                  },

                  builder: (context, state) {
                    if (state.getAllDataStatus is GetAllDataLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    // ValueListenableBuilder<Box<Task>>(
                    //   valueListenable: box.listenable(),
                    //   builder: (BuildContext context, box, Widget? child) {
                    //     return

                    else if (state.getAllDataStatus is GetAllDataCompleted) {
                      GetAllDataCompleted getAllCityCompleted =
                      state.getAllDataStatus as GetAllDataCompleted;
                      List<DataEntity> data = getAllCityCompleted.data;
                      if (data.isEmpty) {
                        return Padding(
                          padding: EdgeInsets.all(20),
                          child: EmptyState(
                              localization: localization,
                              textTheme: textTheme,
                              width: width,
                              height: height),
                        );
                      }

                      return Column(
                        children: [
                          SearchBox(
                              height: height,
                              themeColor: themeColor,
                              localization: localization),
                          SizedBox(
                            height: height / 30,
                          ),

                          Expanded(
                            child: Column(
                                children: [ ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: data.length,
                                    itemBuilder: (context, index) {
                                      final DataEntity task = data[index];
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
                                                    value: task.iscompleted,
                                                    onTap: () {
                                                      setState(() {
                                                        task.iscompleted =
                                                        !task.iscompleted;
                                                      });
                                                    },


                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  description(task: task,
                                                      textTheme: textTheme),
                                                  SizedBox(width: width / 20,),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .only(top: 15),
                                                    child: Container(
                                                      height: height / 25,
                                                      decoration: BoxDecoration(
                                                          borderRadius: BorderRadius
                                                              .circular(5),
                                                          color: getRandomColor()
                                                      ),
                                                      child: Padding(
                                                          padding: const EdgeInsets
                                                              .all(4),
                                                          child: Center(
                                                              child: Text(
                                                                  task.category
                                                                      .categoryNameEntity
                                                                      .toString()))),
                                                    ),
                                                  ),
                                                  SizedBox(width: 5,),
                                                  priority(height: height,
                                                      themeColor: themeColor,
                                                      task: task),

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
                                ]),

                          ),

                        ],
                      );
                    }
                    if (state.getAllDataStatus is GetAllDataError) {
                      GetAllDataError getAllCityError =
                      state.getAllDataStatus as GetAllDataError;

                      return Center(
                        child: Text(getAllCityError.message!),
                      );
                    }
                    return Container();
                  },
                )
               )
             ,);
  }
}





