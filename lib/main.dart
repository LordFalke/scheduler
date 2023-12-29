import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:scheduler/pages/Lesson_Selector.dart';

import 'pages/Calendar.dart';
import 'pages/intro_page.dart';
import 'pages/models/lesson.dart';

void main() async{
  await Hive.initFlutter();

  Hive.registerAdapter(LessonAdapter());
  await Hive.openBox("stored_lessons");

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // home: Calendar(),
      home: Scaffold(body: LessonSelector(),),
      debugShowCheckedModeBanner: false,
    );
  }
}
