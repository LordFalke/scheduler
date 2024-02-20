import "package:flutter/material.dart";
import "package:hive/hive.dart";
import "package:scheduler/pages/Calendar.dart";
import "package:scheduler/pages/components/lesson_selectable.dart";
import "package:scheduler/pages/components/lesson_tile.dart";

import "../database.dart";
import "models/lesson.dart";

class LessonSelector extends StatefulWidget {
  VoidCallback refreshPage;
  LessonSelector({super.key, required this.refreshPage});
  
  @override
  State<LessonSelector> createState() => _LessonSelectorState();
}

class _LessonSelectorState extends State<LessonSelector> {
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

    db.loadSelected();
    super.initState();
  }

  // void refreshPage() {
  //   setState(() {});
  // }

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
                "Lesson Selector",
                style: TextStyle(fontSize: 29, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: ListView.builder(
                  itemCount: db.selectableLessons.length,
                  itemBuilder: (context, index) {
                    // if (!db.selectedLessons.contains(db.selectableLessons[index])) {
                    
                    return SelectableLesson(
                      inputLesson: db.selectableLessons[index],
                      db: db,
                      refreshPage: widget.refreshPage,
                      refreshMenu: refreshMenu,
                    );
                    // }
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
