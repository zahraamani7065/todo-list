import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:todo_list_app/features/category/domain/entity/category_entity.dart';
import 'package:todo_list_app/features/main/domain/entity/data_entity.dart';
import 'package:todo_list_app/features/main/presentation/%20block/task_list_bloc.dart';


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

  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;
    final localization = AppLocalizations.of(context);

    return BlocBuilder<TaskListBloc,TaskListState>(
      builder: (BuildContext context, TaskListState state) {

        return AlertDialog(
          title: Text(
            localization!.addTask,
            style: textTheme.headline5,
          ),
          content: Container(
            height: height / 4,
            child: Column(
              children: [
                TextField(
                  controller: _controller,
                  decoration: InputDecoration(labelText: localization.taskTitle),
                ),
                TextField(
                  controller: _descriptionController,
                  decoration: InputDecoration(labelText: localization.description),
                )
              ],
            ),
          ),
          actions: [
            Row(
              children: [
                IconButton(
                    onPressed: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1950),
                          //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime(2100));

                      if (pickedDate != null) {
                        print(
                            pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                        String formattedDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate);
                        print(formattedDate);
                        if (pickedDate != null) {
                          //formatted date output using intl package =>  2021-03-16
                          setState(() {
                            _dateTime = pickedDate;
                            dateInput.text =
                                formattedDate; //set output date to TextField value.
                          });
                        }
                      } else {}
                    },
                    icon: const Icon(Icons.access_alarm)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.tag)),
                IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                                title: Text(
                                  'Select Priority',
                                  style: textTheme.bodyText2,
                                ),
                                content: Container(
                                    width: width / 1.5,
                                    // Adjust the width to your preference
                                    height: height / 3,
                                    child: ListView.builder(
                                        itemCount: 3, // Number of rows
                                        itemBuilder:
                                            (BuildContext context, int rowIndex) {
                                          return Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children:
                                            List.generate(3, (int columnIndex) {
                                              int priority =
                                                  rowIndex * 3 + columnIndex + 1;
                                              return GestureDetector(
                                                  onTap: () {
                                                    _proirity = priority;
                                                    Navigator.of(context)
                                                        .pop(); // Close the dialog after selection
                                                  },
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsets.all(4),
                                                    child: Container(
                                                        width: width / 5,
                                                        height: height / 10,
                                                        decoration: BoxDecoration(
                                                            color: themeColor
                                                                .colorScheme
                                                                .onSecondary,
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(4)),
                                                        child: Row(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                            children: [
                                                              Text(' $priority'),
                                                              const SizedBox(
                                                                width: 4,
                                                              ),
                                                              const Icon(
                                                                  CupertinoIcons
                                                                      .flag)
                                                            ])),
                                                  ));
                                            }),
                                          );
                                        })));
                          });
                    },
                    icon: const Icon(Icons.flag)),
                Expanded(
                  child: TextButton(
                    child: Text(localization.add),
                    onPressed: () {
                      final task = DataEntity(
                          name: _controller.text,
                          description: _descriptionController.text.toString(),
                          iscompleted: false,
                          dateTime: _dateTime,
                          category: CategoryEntity(
                            categoryIconEntity: "Home",
                            categoryNameEntity: "Home",
                            categoryColorEntity:"Blue",
                          ),
                          proirity: _proirity);
                      BlocProvider.of<TaskListBloc>(context).add(SaveDataEvent(task));
                      BlocProvider.of<TaskListBloc>(context).add(GetAllDataEvent());
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            )
          ],
         );
      },

    );
  }
}
