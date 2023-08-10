import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_list_app/features/intro/presentation/screens/onboading_one.dart';
import 'package:todo_list_app/features/intro/presentation/screens/onboading_three.dart';
import 'package:todo_list_app/features/intro/presentation/screens/startScreen.dart';

import '../../../../utils/images/svg_logos.dart';
import '../screens/introduction_screen.dart';
import '../screens/onboading_two.dart';

class OnboadingItemsWidget extends StatelessWidget {
  const OnboadingItemsWidget({
    super.key,
    required this.height,
    required this.width,
    required this.imageSource,
    required this.index,
    required this.title,
    required this.firstGuidance,
    required this.secondGuidance,
  });

  final double height;
  final double width;
  final String imageSource;
  final int index;
  final String title;
  final String firstGuidance;
  final String secondGuidance;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Skip",
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            Center(child: SvgPicture.string(imageSource)),
            SizedBox(
              height: height / 13,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: height / 180,
                    width: width / 14,
                    color: index == 1 ? Colors.white : Colors.grey),
                const SizedBox(
                  width: 3,
                ),
                Container(
                  height: height / 180,
                  width: width / 14,
                  color: index == 2 ? Colors.white : Colors.grey,
                ),
                const SizedBox(
                  width: 3,
                ),
                Container(
                  height: height / 180,
                  width: width / 14,
                  color: index == 3 ? Colors.white : Colors.grey,
                ),
              ],
            ),
            SizedBox(height: height / 16),
            Center(
              child: Text(
                title,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: Colors.white),
              ),
            ),
            SizedBox(
              height: height / 15,
            ),
            Center(
              child: Text(
                firstGuidance,
                textDirection: TextDirection.ltr,
                style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    color: Colors.grey),
              ),
            ),
            Center(
              child: Text(
                secondGuidance,
                textDirection: TextDirection.ltr,
                style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    color: Colors.grey),
              ),
            ),
            SizedBox(
              height: height / 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) {
                        if (index == 1) {
                          return const IntroductionScreen();
                        } else if (index == 2) {
                          return OnboadingOne();
                        }

                        return OnboadingTwo();
                      }));
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        primary: Colors.black,
                        minimumSize: Size(width / 4, 50)),
                    child: const Text(
                      "Back",
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) {
                        if (index == 1) {
                          return OnboadingTwo();
                        } else if (index == 2) {
                          return OnBoadingthree();
                        }

                        return StartScreen();
                      }));
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        primary: Colors.indigoAccent,
                        minimumSize: Size(width / 4, 50)),
                    child: const Text(
                      "Next",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
