import "dart:math";

import "package:flutter/material.dart";
import "package:hive/hive.dart";
import "package:scheduler/database.dart";
import "package:scheduler/pages/Lesson_Menu.dart";
import "package:scheduler/pages/Lesson_Selector.dart";
import "package:scheduler/pages/models/lesson.dart";
import "package:scroll_snap_list/scroll_snap_list.dart";

import "components/day_tile.dart";
import "models/empty_lesson.dart";

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  final _myBox = Hive.box("stored_lessons");
  Database db = Database();

  int _focusedIndex = 0;
  void _onItemFocus(int index) {
    setState(() {
      _focusedIndex = index;
    });
  }

  @override
  void initState() {
    if(_myBox.get("selectable_lessons") == null) {
      db.createInitialData();
      // db.updateData();
    } else {
      db.loadData();
      db.loadSelected();  
    }


    

    super.initState();
  }

  void resetDatabase() {
    setState(() {
      db.createInitialData();
    });
    db.updateData();
  }

  void refreshPage() {
    setState(() {});
  }

  List<Object> generateLessonTileData(int dayIndex) {
    List<Object> lessonTileData = [
      EmptyLesson(),
      EmptyLesson(),
      EmptyLesson(),
      EmptyLesson(),
      EmptyLesson(),
      EmptyLesson(),
      EmptyLesson(),
      EmptyLesson(),
    ];

    List lessons = [];
    for (var lesson in db.selectedLessons) {
      if (lesson.dayOfTheWeek == dayIndex) {
        lessons.add(lesson);
      }

      if (lesson.labs != null) {
        for (var labLesson in lesson.labs) {
          if (labLesson.dayOfTheWeek == dayIndex) {
            lessons.add(labLesson);
          }
        }
      }
    }

    for (var lesson in lessons) {
      lessonTileData[lesson.blockStart] = lesson;
    }

    for (var lesson in lessons) {
      for (var i = 0; i < lesson.blockEnd - lesson.blockStart - 1; i++) {
        lessonTileData.removeAt(lessonTileData.indexOf(lesson) + 1);
      }
    }

    return lessonTileData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => LessonMenu(refreshPage: refreshPage,))),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        backgroundColor: Colors.grey.shade900,
        splashColor: const Color.fromRGBO(158, 158, 158, 1),
        elevation: 10,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          SizedBox(
            height: 1150,
            child: ScrollSnapList(
              itemSize: MediaQuery.of(context).size.width * .84,
              onItemFocus: _onItemFocus,
              // padding: EdgeInsets.only(
              //   right: MediaQuery.of(context).size.width * .05,
              // ),
              itemCount: 5,
              initialIndex: DateTime.now().weekday - 1,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                List<Object> day1 = generateLessonTileData(0);
                List<Object> day2 = generateLessonTileData(1);
                List<Object> day3 = generateLessonTileData(2);
                List<Object> day4 = generateLessonTileData(3);
                List<Object> day5 = generateLessonTileData(4);

                var days = [day1, day2, day3, day4, day5];

                return Day(
                  lessons: days[index],
                  dayOfTheWeek: index,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
