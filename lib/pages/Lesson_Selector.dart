import "package:flutter/material.dart";
import "package:hive/hive.dart";
import "package:scheduler/pages/components/lesson_selectable.dart";
import "package:scheduler/pages/components/lesson_tile.dart";

import "../database.dart";


class LessonSelector extends StatefulWidget {
  const LessonSelector({super.key});

  @override
  State<LessonSelector> createState() => _LessonSelectorState();
}

class _LessonSelectorState extends State<LessonSelector> {
  final _myBox = Hive.box("stored_lessons");
  Database db = Database();

  @override
  void initState() {
    if(_myBox.get("selectable_lessons") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: ListView.builder(
          itemCount: db.selectableLessons.length,
          itemBuilder: (context, index) {
            return SelectableLesson(inputLesson: db.selectableLessons[index]);
          },
        ),
      ),
    );
  }
}