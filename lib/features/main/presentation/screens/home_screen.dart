import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_list_app/features/main/domain/entity/data_entity.dart';
import 'package:todo_list_app/features/main/presentation/%20block/get_task_status.dart';
import 'package:todo_list_app/features/main/presentation/%20block/task_list_bloc.dart';
import '../widgets/items_description.dart';
import '../widgets/priority.dart';
import '../widgets/check_box.dart';
import '../widgets/emptyState.dart';
import '../widgets/searchBox.dart';



class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TaskListBloc taskListBloc;

  @override
  void initState() {
    // BlocProvider.of<TaskListBloc>(context).add(GetAllDataEvent());
    taskListBloc = BlocProvider.of<TaskListBloc>(context);
    taskListBloc.add(GetAllDataEvent());
    super.initState();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    BlocProvider.of<TaskListBloc>(context).close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final box = Hive.box<Task>(taskBoxName);
    final themeColor = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;
    final localization = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: themeColor.backgroundColor,
      body: SafeArea(
          child: BlocBuilder<TaskListBloc, TaskListState>(
        buildWhen: (previous, current) {
          if (current.getAllDataStatus == previous.getAllDataStatus) {
            return false;
          }
          return true;
        },
        builder: (context, state) {
          if (state.getAllDataStatus is GetAllDataLoading) {
            BlocProvider.of<TaskListBloc>(context).add(GetAllDataEvent());

            print("get data**");
          } else if (state.getAllDataStatus is GetAllDataCompleted) {
            print("get all data complated");
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
                SizedBox(
                  height: height / 30,
                ),
                SearchBox(
                    height: height,
                    themeColor: themeColor,
                    localization: localization),
                SizedBox(
                  height: height / 30,
                ),

                // Expanded(
                //   child:
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(children: [
                      ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            final DataEntity task = data[index];
                            return Padding(
                              padding: const EdgeInsets.all(10),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: themeColor.colorScheme.onBackground),
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
                                      description(
                                          task: task, textTheme: textTheme),
                                      SizedBox(
                                        width: width / 20,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 15),
                                        child: Container(
                                          height: height / 25,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Color(task.category.categoryColorEntity),),
                                          child: Padding(
                                              padding: const EdgeInsets.all(4),
                                              child: Center(
                                                  child: Text(task.category
                                                      .categoryNameEntity
                                                      .toString()))),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: priority(
                                            height: height,
                                            themeColor: themeColor,
                                            task: task),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                      SizedBox(
                        height: height / 9,
                      )
                    ]),

                    // ),
                  ),
                )
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
      )),
    );
  }
}
