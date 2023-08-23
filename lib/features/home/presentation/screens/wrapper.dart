import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_list_app/features/add_task/presentation/Screen/add_task_dialog.dart';
import 'package:todo_list_app/features/focuse/presentation/Screen/focuse_screen.dart';
import 'package:todo_list_app/features/home/presentation/screens/home_screen.dart';
import 'package:todo_list_app/features/profile/presentation/Screen/profile_screen.dart';

import '../../../../main.dart';
import '../../../button_navigation/button_navigation.dart';
import '../../data/local/data.dart';

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
    final box=Hive.box<Task>(taskBoxName);
    return Scaffold(
      body: Stack(children: [
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
      ]),
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
        return AddTaskDialog();
      },
    );
  }

}
