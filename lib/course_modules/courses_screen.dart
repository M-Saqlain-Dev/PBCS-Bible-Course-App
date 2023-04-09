import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pbcs_bible_course/features/get_started_screen/login_screen.dart';
import 'package:pbcs_bible_course/utils/utils.dart';
import '../../constants/colors.dart';

class CoursesScreen extends StatelessWidget {
  CoursesScreen({super.key});

  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: appPrimaryColor,
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          width: mediaQuery.size.width * 0.9,
          height: mediaQuery.size.height * 0.95,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  Image.asset(
                    'assets/logo.png',
                    width: mediaQuery.size.width * 0.15,
                  ),
                  const SizedBox(width: 20),
                  // Expanded(
                  Text(
                    'Courses',
                    style: TextStyle(
                      color: appPrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Calibri',
                      fontSize: 35,
                    ),
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.ltr,
                  ),

                  const SizedBox(
                    width: 12,
                  ),
                  IconButton(
                    onPressed: () {
                      auth.signOut().then((value) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      }).onError((error, stackTrace) {
                        Utils().toastMessage(error.toString());
                      });
                    },
                    icon: const Icon(Icons.login_outlined),
                    iconSize: 30.0,
                    color: appPrimaryColor,
                  )
                  // ),
                ],
              ),
              // const SizedBox(height: 20),
              // const Text(
              //   'توریت زبور اور انجیل پر مبنی کورسز',
              //   style: TextStyle(
              //     fontWeight: FontWeight.bold,
              //     fontFamily: 'Jameel Noori Nastaleeq Kasheeda',
              //     fontSize: 30,
              //   ),
              //   textAlign: TextAlign.center,
              //   textDirection: TextDirection.rtl,
              // ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(20.0),
                width: mediaQuery.size.width * 0.9,
                height: mediaQuery.size.height * 0.15,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: tSecondaryColor,
                  boxShadow: [
                    BoxShadow(
                      color: tSecondaryColor,
                      spreadRadius: 5,
                      blurRadius: 15,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Image.asset(
                    //   'assets/sun_logo.png',
                    //   width: mediaQuery.size.width * 0.5,
                    // ),
                  ],
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(20.0),
                width: mediaQuery.size.width * 0.9,
                height: mediaQuery.size.height * 0.15,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: tSecondaryColor,
                  boxShadow: [
                    BoxShadow(
                      color: tSecondaryColor,
                      spreadRadius: 5,
                      blurRadius: 15,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Image.asset(
                    //   'assets/sun_logo.png',
                    //   width: mediaQuery.size.width * 0.5,
                    // ),
                  ],
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(20.0),
                width: mediaQuery.size.width * 0.9,
                height: mediaQuery.size.height * 0.15,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: tSecondaryColor,
                  boxShadow: [
                    BoxShadow(
                      color: tSecondaryColor,
                      spreadRadius: 5,
                      blurRadius: 15,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Image.asset(
                    //   'assets/sun_logo.png',
                    //   width: mediaQuery.size.width * 0.5,
                    // ),
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
