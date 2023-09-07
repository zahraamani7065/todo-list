import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../core/utils/images/svg_logos.dart';



class EmptyState extends StatelessWidget {
  const EmptyState({
    super.key,
    required this.localization,
    required this.textTheme,
    required this.width,
    required this.height,
  });

  final AppLocalizations? localization;
  final TextTheme textTheme;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                Icon(CupertinoIcons.sort_down),
                Expanded(
                    child: Center(
                        child: Text(
                          localization!.index,
                          style: textTheme.headline5,
                        ))),
                ClipRRect(
                  child: Image.asset(
                    "assets/profile.png",
                    width: width / 9,
                    height: width / 9,
                  ),
                  borderRadius:
                  BorderRadius.circular(width / 18),
                )
              ],
            ),
          ),
          Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.string(svgSourceHomeScreen),
                    Text(
                      localization!.emptyScreenText,
                      style: textTheme.bodyText1,
                    ),
                    SizedBox(
                      height: height / 30,
                    ),
                    Text(
                      localization!.topToPlus,
                      style: textTheme.bodyText2,
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }}