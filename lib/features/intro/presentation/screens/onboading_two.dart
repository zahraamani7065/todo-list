import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../core/utils/images/svg_logos.dart';
import '../widgets/onboading_item.dart';

class OnboadingTwo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final localization=AppLocalizations.of(context);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: OnboadingItemsWidget(
        height: height,
        width: width,
        title: localization!.titleTwo,
        imageSource: svgSourceOnBoadingTwo,
        index: 2,
        firstGuidance: localization!.firstGuidanceOne,
        secondGuidance: localization!.secondGuidanceOne,
      ),
    );
  }
}