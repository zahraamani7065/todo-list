import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCheckBox extends StatelessWidget {
  final bool value;
  final Function() onTap;

  const MyCheckBox({super.key, required this.value, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context);

    return InkWell(
      onTap: onTap,
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border:
          !value ? Border.all(color: themeColor.colorScheme.secondary, width: 2) : null,
          color: value ? themeColor.primaryColor : null,
        ),
        child: value
            ? Icon(
          CupertinoIcons.check_mark,
          size: 16,
          color: themeColor.colorScheme.secondary,
        )
            : null,
      ),
    );
  }
}

class MyCheckBoxShape extends StatelessWidget {
  final bool value;
  final Color color;

  const MyCheckBoxShape({super.key, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      width: 16,
      height: 16,
      decoration:
      BoxDecoration(borderRadius: BorderRadius.circular(12), color: color),
      child: value
          ? Icon(
        CupertinoIcons.check_mark,
        size: 12,
        color: themeData.colorScheme.onPrimary,
      )
          : null,
    );
  }
}
