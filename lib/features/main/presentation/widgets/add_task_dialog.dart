import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:todo_list_app/features/category/data/data_source/category_data.dart';
import 'package:todo_list_app/features/category/domain/entity/category_entity.dart';
import 'package:todo_list_app/features/category/presentation/bloc/get_category_status.dart';
import 'package:todo_list_app/features/main/domain/entity/data_entity.dart';
import 'package:todo_list_app/features/main/presentation/%20block/save_task_status.dart';
import 'package:todo_list_app/features/main/presentation/%20block/task_list_bloc.dart';
import '../ block/get_task_status.dart';
import '../../../../core/services/locator.dart';
import '../../../category/presentation/bloc/category_bloc.dart';
import '../../../category/presentation/widgets/category_dialog.dart';

class AddTaskDialog extends StatefulWidget {
  @override
  State<AddTaskDialog> createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {
  TextEditingController dateInput = TextEditingController();
  late DateTime _dateTime;
  late TextEditingController _controller;
  late int _proirity;
  late TextEditingController _descriptionController;
  CategoryEntity? selectedCategory;


  // late final TaskListBloc taskListBloc;

  @override
  void dispose() {
    _controller.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // You can initialize the _dateTime here if you want a default value.
    _dateTime = DateTime.now();
    _controller = TextEditingController();
    _descriptionController = TextEditingController();
    _proirity = 1;

  }

  void resetDialogState() {
    setState(() {
      _controller.clear();
      _descriptionController.clear();
      _proirity = 1;
      final newTaskListState = TaskListState(
        getAllDataStatus: GetAllDataLoading(),
        saveDataStatus: SaveTaskLoading(),
      );
      BlocProvider.of<TaskListBloc>(context).emit(newTaskListState);
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;
    final localization = AppLocalizations.of(context);
    bool customBuildWhen(
        TaskListState previousState, TaskListState currentState) {
      bool saveData =
          previousState.saveDataStatus != currentState.saveDataStatus;
      bool getData =
          previousState.getAllDataStatus != currentState.getAllDataStatus;

      return saveData != getData;
    }
    return BlocBuilder<TaskListBloc, TaskListState>(
        buildWhen: customBuildWhen,
        builder: (BuildContext context, state) {
              return AlertDialog(
                title: Text(
                  localization!.addTask,
                  style: textTheme.headline5,
                ),
                content:
                StatefulBuilder( // You need this, notice the parameters below:
                    builder: (BuildContext context, StateSetter setState) {
                      return Container(
                          height: height / 4,
                          child: Column(
                            children: [
                              TextField(
                                controller: _controller,
                                decoration:
                                InputDecoration(
                                    labelText: localization.taskTitle),
                              ),
                              TextField(
                                controller: _descriptionController,
                                decoration:
                                InputDecoration(labelText: localization
                                    .description),
                              )
                            ],
                          ));
                    }),
                actions: [
                  Row(children: [
                    IconButton(
                        onPressed: () async {
                          DateTime? pickedDate = await buildShowDatePicker(
                              context);
                          if (pickedDate != null) {
                            print(pickedDate);
                            String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                            print(formattedDate);
                            if (pickedDate != null) {
                              setState(() {
                                _dateTime = pickedDate;
                                dateInput.text = formattedDate;
                              });
                            }
                          } else {}
                        },
                        icon: const Icon(Icons.access_alarm)),
                    IconButton(
                        onPressed: () async{
                            selectedCategory=await showDialog<CategoryEntity>(
                            context: context,
                            builder: (BuildContext context) {
                              return CategoryDialog();
                            },
                          );
                        },
                        icon: const Icon(Icons.category)),
                    IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return priorityDialog(localization, textTheme,
                                    width,
                                    height, themeColor);
                              });
                        },
                        icon: const Icon(Icons.flag)),
                    Expanded(
                        child: TextButton(
                            child: Text(localization.add),
                            onPressed: () async {
                              // print("category data is  "+ selectedCategory );
                              // IconData iconData = CupertinoIcons.home;
                              final task = DataEntity(
                                  name: _controller.text,
                                  description: _descriptionController.text
                                      .toString(),
                                  iscompleted: false,
                                  dateTime: _dateTime,
                                  category: selectedCategory ?? CategoryEntity(categoryColorEntity:Color(0xFFB74093).value, categoryNameEntity: "Home", categoryIconEntity: "Home"),
                                  proirity: _proirity);
                              BlocProvider.of<TaskListBloc>(context)
                                  .add(SaveDataEvent(task));
                              resetDialogState();
                              Navigator.of(context).pop();
                            })),
                  ])
                ],
              );


      }  );

  }

  Future<DateTime?> buildShowDatePicker(BuildContext context) {
    return showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime(2100));
  }

  AlertDialog priorityDialog(AppLocalizations localization, TextTheme textTheme,
      double width, double height, ThemeData themeColor) {
    return AlertDialog(
        title: Text(
          localization.selectPriority,
          style: textTheme.bodyText2,
        ),
        content: Container(
            width: width / 1.5,
            // Adjust the width to your preference
            height: height / 3,
            child: ListView.builder(
                itemCount: 3, // Number of rows
                itemBuilder: (BuildContext context, int rowIndex) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: List.generate(3, (int columnIndex) {
                      int priority = rowIndex * 3 + columnIndex + 1;
                      return GestureDetector(
                          onTap: () {
                            _proirity = priority;
                            Navigator.of(context)
                                .pop(); // Close the dialog after selection
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: Container(
                                width: width / 5,
                                height: height / 10,
                                decoration: BoxDecoration(
                                    color: themeColor.colorScheme.onSecondary,
                                    borderRadius: BorderRadius.circular(4)),
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(' $priority'),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      const Icon(CupertinoIcons.flag)
                                    ])),
                          ));
                    }),
                  );
                })));
  }
}
