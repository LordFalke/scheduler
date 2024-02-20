import "package:flutter/material.dart";
import "package:hive/hive.dart";
import "package:scheduler/pages/components/lesson_removable.dart";
import "package:scheduler/pages/components/lesson_selectable.dart";
import "package:scheduler/pages/components/lesson_tile.dart";

import "../database.dart";
import "models/lesson.dart";

class LessonDeselector extends StatefulWidget {
  VoidCallback refreshPage;
  LessonDeselector({super.key, required this.refreshPage});

  @override
  State<LessonDeselector> createState() => _LessonDeselectorState();
}

class _LessonDeselectorState extends State<LessonDeselector> {
  final _myBox = Hive.box("stored_lessons");
  Database db = Database();

  void refreshMenu() {
    setState(() {});
  }

  @override
  void initState() {
    if (_myBox.get("selectable_lessons") == null) {
      db.createInitialData();
    } else {
      db.loadData();
      db.loadLabs();
      db.loadSelected();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Text(
                "Lesson Deselector",
                style: TextStyle(fontSize: 29, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: ListView.builder(
                  itemCount: db.selectedLessons.length,
                  itemBuilder: (context, index) {
                    
                    return RemovableLesson(
                      inputLesson: db.selectedLessons[index],
                      db: db,
                      refreshPage: widget.refreshPage,
                      refreshMenu: refreshMenu,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
