import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    super.key,
    required this.height,
    required this.themeColor,
    required this.localization,
  });

  final double height;
  final ThemeData themeColor;
  final AppLocalizations? localization;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height / 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1),
        color: themeColor.colorScheme.onSecondary,
      ),
      child: TextField(
        decoration: InputDecoration(
            prefixIcon: Icon(
              CupertinoIcons.search,
              color: themeColor.colorScheme.secondary,
            ),
            label: Text(localization!.search)),
      ),
    );
  }
}
