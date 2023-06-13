import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:pbcs_bible_course/course_modules/Course_01/course_01.dart';
import 'package:pbcs_bible_course/features/get_started_screen/sign_up_screen.dart';
import 'audio_module/audio_file_page.dart';
import 'course_modules/courses_screen.dart';
import 'features/get_started_screen/first_screen.dart';
import 'features/get_started_screen/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';

import 'features/get_started_screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Firebase.initializeApp();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const FirstScreen(),
      home: CoursesScreen(),
      // home: const SignUpScreen(),
      // home: LoginScreen(),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:audioplayers/audioplayers.dart';
// import 'dart:async';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Audio Player'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final player = AudioPlayer();
//   bool isPlaying = false;
//   Duration duration = Duration.zero;
//   Duration position = Duration.zero;

//   String formatTime(int seconds) {
//     return '${(Duration(seconds: seconds))}'.split('.')[0].padLeft(8, '0');
//   }

//   @override
//   void initState() {
//     super.initState();

//     player.onPlayerStateChanged.listen((state) {
//       setState(() {
//         isPlaying = state == PlayerState.playing;
//       });
//     });

//     player.onDurationChanged.listen((newDuration) {
//       setState(() {
//         duration = newDuration;
//       });
//     });

//     player.onPositionChanged.listen((newPosition) {
//       setState(() {
//         position = newPosition;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 CircleAvatar(
//                   radius: 20,
//                   child: IconButton(
//                     icon: Icon(
//                       isPlaying ? Icons.pause : Icons.play_arrow,
//                     ),
//                     onPressed: () {
//                       if (isPlaying) {
//                         player.pause();
//                       } else {
//                         player.play(AssetSource('audio.mp3'));
//                       }
//                     },
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 20,
//                 ),
//                 // CircleAvatar(
//                 //   radius: 25,
//                 //   child: IconButton(
//                 //     icon:const Icon(Icons.stop),
//                 //     onPressed: (){
//                 //       player.stop();
//                 //     },
//                 //   ),
//                 // ),
//                 Text(formatTime(position.inSeconds)),
//                 Slider(
//                   min: 0,
//                   max: duration.inSeconds.toDouble(),
//                   value: position.inSeconds.toDouble(),
//                   onChanged: (value) {
//                     final position = Duration(seconds: value.toInt());
//                     player.seek(position);
//                     player.resume();
//                   },
//                 ),
//                 Text(formatTime((duration - position).inSeconds)),
//                 // Container(
//                 //   padding: const EdgeInsets.all(20),
//                 //   child: Row(
//                 //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 //     children: [
//                 //       Text(formatTime(position.inSeconds)),
//                 //       Text(formatTime((duration - position).inSeconds)),
//                 //     ],
//                 //   ),
//                 // ),
//               ],
//             ),
//             // Slider(
//             //   min: 0,
//             //   max: duration.inSeconds.toDouble(),
//             //   value: position.inSeconds.toDouble(),
//             //   onChanged: (value) {
//             //     final position = Duration(seconds: value.toInt());
//             //     player.seek(position);
//             //     player.resume();
//             //   },
//             // ),
//             // Container(
//             //   padding: const EdgeInsets.all(20),
//             //   child: Row(
//             //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //     children: [
//             //       Text(formatTime(position.inSeconds)),
//             //       Text(formatTime((duration - position).inSeconds)),
//             //     ],
//             //   ),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }
