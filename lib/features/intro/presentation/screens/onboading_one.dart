import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_app/features/intro/presentation/widgets/onboading_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../core/utils/images/svg_logos.dart';

import 'onboading_three.dart';

class OnboadingOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final localization=AppLocalizations.of(context);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
        child:
        OnboadingItemsWidget(
        height: height,
        width: width,
        title: localization!.titleOne,
        imageSource: svgSourceOnBoadingOne,
        index: 1,
        firstGuidance:localization!.firstGuidanceOne ,
        secondGuidance: localization!.secondGuidanceOne,
      ),
    );
  }
}
