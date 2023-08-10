import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_list_app/features/intro/presentation/screens/onboading_one.dart';
import 'package:todo_list_app/features/login/login_Screen.dart';
import 'package:todo_list_app/utils/images/svg_logos.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1)).then((value) => Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) {
          return OnboadingOne();
        })));
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.string(svgSourceIntro),
            const Text(
              "UpTodo",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    ));
  }
}
