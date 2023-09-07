import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import '../../../../core/utils/images/svg_logos.dart';
import '../../../main/presentation/screens/wrapper.dart';


class IntroductionScreen extends StatefulWidget {
  final Function(Language language) selectedLang;
  const IntroductionScreen({super.key, required this.selectedLang});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1)).then((value) =>
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) {

          return Wrapper();
        })));
    // TODO: implement initState
    super.initState();
  }

  Language languagee = Language.en;


  void updateSelectedLanguage(Language language) {
    setState(() {
      widget.selectedLang(language);
      languagee = language;
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final localization=AppLocalizations.of(context);
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Row(children: [
                  Text(
                    localization!.chooseLan,
                    style: textTheme.headline2,
                  ),
                  SizedBox(width: 20,),
                  CupertinoSlidingSegmentedControl<Language>(
                      groupValue: languagee,
                      children: {
                        Language.en: Text(localization!.english),
                        Language.fa: Text(localization!.persian),
                      },
                      onValueChanged: (value) => updateSelectedLanguage(value!))
                ])),
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
            ),
            Center(child: SvgPicture.string(svgSourceIntro)),
            Center(
              child: Text(
                "UpTodo",
                style: textTheme.headline6,
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

enum Language { en, fa }
