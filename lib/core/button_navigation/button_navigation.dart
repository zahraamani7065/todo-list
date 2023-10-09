import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const int homeIndex = 0;
const int profileIndex = 1;
const int FocuseIndex = 2;
const int calenderIndex = 3;
const int addTask = 4;

class BottomNavigation extends StatefulWidget {
  final Function(int index) onSelectedTab;
  final int selectedIndex;

  const BottomNavigation(
      {super.key, required this.onSelectedTab, required this.selectedIndex});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;
    // final localization = AppLocalizations.of(context);
    return Container(
      height: height/8,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 65,
              decoration: BoxDecoration(
                color: Colors.grey.shade800,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 20,
                      color: const Color(0xaa9B8487).withOpacity(0.3))
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BottomNavigationItem(
                    iconFileName: Icons.home,
                    title: 'Home',
                    onTap: () {
                      widget.onSelectedTab(homeIndex);
                    },
                  ),
                  BottomNavigationItem(
                    iconFileName: Icons.person,
                    onTap: () {
                      widget.onSelectedTab(profileIndex);
                    },
                    title: 'profile',
                  ),
                  Expanded(child: Container()),
                  BottomNavigationItem(
                      iconFileName: Icons.zoom_in,
                      title: 'Focuse',
                      onTap: () {
                        widget.onSelectedTab(FocuseIndex);
                      }),
                  BottomNavigationItem(
                      iconFileName: Icons.calendar_month,
                      title: 'Calender',
                      onTap: () {
                        widget.onSelectedTab(calenderIndex);
                      }),
                ],
              ),
            ),
          ),
          Center(
            child: InkWell(
              onTap: (){
                widget.onSelectedTab(addTask);
              },
              child: Container(
                  width: 65,
                  height: 85,
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 65,
                    width: 65,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32.5),
                        color: themeColor.primaryColor,
                        ),
                    child: Icon(Icons.add),
                  )),
            ),
          )
        ],
      ),
    );
  }
}

class BottomNavigationItem extends StatelessWidget {
  final iconFileName;
  final String title;
  final Function() onTap;

  const BottomNavigationItem({
    super.key,
    required this.iconFileName,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(child: Icon(iconFileName)),
            SizedBox(height: 4),
            Text(
              title,
              style: themeData.textTheme.caption!
                  .apply(color: themeData.colorScheme.primary),
            )
          ],
        ),
      ),
    );
  }
}
