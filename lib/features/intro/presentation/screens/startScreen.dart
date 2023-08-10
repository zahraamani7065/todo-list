import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_app/features/intro/presentation/screens/onboading_three.dart';
import 'package:todo_list_app/features/login/login_Screen.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (context) {
              return OnBoadingthree();
            })); // Navigate back
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: height / 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                "Welcome to UpTodo",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                    color: Colors.white),
              ),
            ),
            SizedBox(
              height: height / 17,
            ),
            const Center(
              child: Text(
                "Please login to your account or create",
                textDirection: TextDirection.ltr,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    color: Colors.grey),
              ),
            ),
            const Center(
              child: Text(
                "new account to continue",
                textDirection: TextDirection.ltr,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    color: Colors.grey),
              ),
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
                    primary: Colors.black,
                    backgroundColor: Colors.indigoAccent,
                    minimumSize: Size(width, height / 18)),
                child: const Text(
                  "LOGIN",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 20),
                ),
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
                    side: const BorderSide(color: Colors.blue),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                    primary: Colors.black,
                    backgroundColor: Colors.black,
                    minimumSize: Size(width, height / 18)),
                child: const Text(
                  "CREATE ACCOUNT",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
