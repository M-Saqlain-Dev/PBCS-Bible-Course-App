import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:pbcs_bible_course/features/get_started_screen/login_screen.dart';
import 'package:pbcs_bible_course/utils/utils.dart';
import '../../constants/colors.dart';

class CoursesScreen extends StatelessWidget {
  CoursesScreen({super.key});

  final auth = FirebaseAuth.instance;
  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref('Post');
  //  final snapshot = await ref.child('Post').get();

  // ignore: prefer_typing_uninitialized_variables
  var event;
  var username;

  // fetchData() async {
  //   event = await ref.once(DatabaseEventType.value);
  //   username = event.snapshot.value.toString();

  //   return username;
  // }

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

                      // fetchData();
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
                    // Text('Hello'),
                    Expanded(
                      child: FirebaseAnimatedList(
                        query: ref,
                        itemBuilder: (context, snapshot, animation, index) {
                          return ListTile(
                            title: Text(snapshot.child('id').value.toString()),
                          );
                          // return Text("hello world");
                        },
                        //),
                        // child: FirebaseAnimatedList(
                        //   query: ref,
                        //   itemBuilder: (context, snapshot, animation, index) {
                        //     // final key = snapshot.key;
                        //     final value = snapshot.value;
                        //     return ListTile(

                        //       // subtitle: Text(value['description']),
                        //     );
                        //   },
                      ),
                      // child: Row(children: []),
                    ),
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
