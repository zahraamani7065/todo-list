import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_app/features/intro/presentation/screens/onboading_three.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../authentication/screen/login_Screen.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final localization=AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final themeColor = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: themeColor.backgroundColor,
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
            padding: EdgeInsets.only(top: height / 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back,color: Colors.grey,),
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (context) {
                      return OnBoadingthree();
                    })); // Navigate back
                  },
                ),
                SizedBox(height: height/15,),

                Center(
                  child: Text(localization!.welcome, style: textTheme.headline6),
                ),
                SizedBox(
                  height: height / 17,
                ),
                Center(
                  child: Text(
                    localization.loginRequestOne,
                    textDirection: TextDirection.ltr,
                    style: textTheme.headline2,
                  ),
                ),
                Center(
                  child: Text(localization.loginRequestTwo,
                      textDirection: TextDirection.ltr, style: textTheme.headline2),
                ),
                SizedBox(
                  height: height / 3,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) {
                          return const LogInScreen();
                        }),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                        ),
                        backgroundColor: themeColor.primaryColor,
                        minimumSize: Size(width, height / 18)),
                    child: Text(localization.logIn, style: textTheme.headline5),
                  ),
                ),
                SizedBox(
                  height: height / 28,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        side:  BorderSide(color: themeColor.primaryColor),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                        ),
                        primary: Colors.black,
                        backgroundColor: themeColor.backgroundColor,
                        minimumSize: Size(width, height / 18)),
                    child: Text(
                      localization.createAccount,
                      style: textTheme.headline5,
                    ),
                  ),
                ),
              ],
            ),
        ),
          ),
      ),
    );
  }
}
