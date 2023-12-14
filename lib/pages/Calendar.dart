import "dart:math";

import "package:flutter/material.dart";
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
  int _focusedIndex = 0;
  void _onItemFocus(int index) {
    setState(() {
      _focusedIndex = index;
    });
  }


  List<EmptyLesson> generateLessonTileData(List<Lesson> lessons) {
    List<EmptyLesson> lessonTileData = [
      EmptyLesson(),
      EmptyLesson(),
      EmptyLesson(),
      EmptyLesson(),
      EmptyLesson(),
      EmptyLesson(),
      EmptyLesson(),
      EmptyLesson(),
    ];

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
      backgroundColor: Colors.white,
      body: ListView(
      children: [
        // const Padding(
        //   padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 25.0),
        //   child: Center(
        //     child: Text(
        //       "Scheduler",
        //       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        //       // textAlign: TextAlign.center,
        //     ),
        //   ),
        // ),

        //
        SizedBox(
          height: 1150,
          child: ScrollSnapList(
            itemSize: MediaQuery.of(context).size.width * .84,
            onItemFocus: _onItemFocus,
            // padding: EdgeInsets.only(
            //   right: MediaQuery.of(context).size.width * .05,
            // ),
            itemCount: 5,
            initialIndex: DateTime.now().weekday-1,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              List<EmptyLesson> day1 = generateLessonTileData([Lesson(
                module: "ISI",
                topic: "Vorlesung",
                isLab: false,
                labGroup: "none",
                prof: "Sethmann",
                room: "I122",
                blockStart: 1,
                blockEnd: 6,
                color: Colors.deepOrange.shade300,
              ),]);

              List<EmptyLesson> day2 = generateLessonTileData([]);
              List<EmptyLesson> day3 = generateLessonTileData([]);
              List<EmptyLesson> day4 = generateLessonTileData([]);
              List<EmptyLesson> day5 = generateLessonTileData([]);

              var days = [day1, day2, day3, day4, day5];

              return Day(
                lessons: days[index],
                dayOfTheWeek: index,
              );
            },
          ),
        ),
      ],
    )
        // Column(
        //   // crossAxisAlignment: CrossAxisAlignment.center,
        //   children: [
        //     // Header
        //     const Padding(
        //       padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 25.0),
        //       child: Center(
        //         child: Text(
        //           "Scheduler",
        //           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        //           // textAlign: TextAlign.center,
        //         ),
        //       ),
        //     ),

        //     // Calendar / List

        //   ],
        // ),
        );
  }
}
