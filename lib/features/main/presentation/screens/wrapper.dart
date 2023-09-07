import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/features/main/presentation/%20block/task_list_bloc.dart';
import 'package:todo_list_app/locator.dart';
import '../../../../../core/button_navigation/button_navigation.dart';
import '../widgets/add_task_dialog.dart';
import 'home_screen.dart';

class Wrapper extends StatefulWidget {
  @override
  State<Wrapper> createState() => _WrapperState();
}

const int homeIndex = 0;
const int profileIndex = 1;
const int FocuseIndex = 2;
const int calenderIndex = 3;
const int addTask = 4;

class _WrapperState extends State<Wrapper> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        BlocProvider(
        // create:(context)=> TaskListBloc (locator(), locator()),

        create: (_) => locator<TaskListBloc>(),
        child:
        Stack(children: [
          HomeScreen(),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: BottomNavigation(
              onSelectedTab: (int index) {
                setState(() {
                  if (index == 0) {
                    HomeScreen();
                  } else if (index == 1) {
                    profileDialog(context);
                  }
                  else if(index==2){
                    focuseDialog(context);
                  }
                  else if(index==3){
                    calenderDialog(context);
                  }
                  else if(index==4){
                    addDialog(context);
                  }
                });
              },
              selectedIndex: _currentIndex,
            ),
          )
        ])),
    );
  }

  Future<dynamic> profileDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Dialog'),
          content: Text('This is profile.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  Future<dynamic> focuseDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Dialog'),
          content: Text('This is focuse.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  Future<dynamic> calenderDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Dialog'),
          content: Text('This is calender'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  Future<dynamic> addDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return
        BlocProvider(
          create:(_)=> locator<TaskListBloc> (),
        child:
          AddTaskDialog()

        );
      },
    );
  }
}
