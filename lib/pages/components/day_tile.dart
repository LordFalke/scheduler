import "package:flutter/material.dart";
import "package:scheduler/pages/components/lesson_tile.dart";
import "package:scheduler/pages/models/empty_lesson.dart";
import "package:scheduler/pages/models/lesson.dart";

class Day extends StatelessWidget {
  final List<EmptyLesson> lessons;
  final int dayOfTheWeek;
  Day({super.key, required this.lessons, required this.dayOfTheWeek});

  String dayOfTheWeekToString() {
    switch (dayOfTheWeek) {
      case 0:
        return "Montag";
      case 1:
        return "Dienstag";
      case 2:
        return "Mittwoch";
      case 3:
        return "Donnerstag";
      case 4:
        return "Freitag";
      default: 
        return "null";
    }
  }

  String getDate() {
    String date = "";
    DateTime currentDate = DateTime.now();
    currentDate = currentDate.subtract(Duration(days: currentDate.weekday-dayOfTheWeek-1));
    
    // day of the month

    date += "${currentDate.day}. ";

    // month index to string
    switch (currentDate.month) {
      case 1:
        date += "Januar ";
        break;
      case 2:
        date += "Februar ";
        break;
      case 3:
        date += "März ";
        break;
      case 4:
        date += "April ";
        break;
      case 5:
        date += "Mai ";
        break;
      case 6:
        date += "Juni ";
        break;
      case 7:
        date += "Juli ";
        break;
      case 8:
        date += "August ";
        break;
      case 9:
        date += "September ";
        break;
      case 10:
        date += "Oktober ";
        break;
      case 11:
        date += "November ";
        break;
      case 12:
        date += "Dezember ";
        break;
    }

    date += "${currentDate.year}";
    return date;
  }

  List<Widget> createLessonTiles(BuildContext context) {
    List<Widget> lessonTileList = [];

    lessonTileList.add(Padding(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      child: Container(
        height: 100,
        width: MediaQuery.of(context).size.width * .8,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              offset: Offset(0, 10),
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              dayOfTheWeekToString(),
              style: TextStyle(fontSize: 29, fontWeight: FontWeight.bold),
            ),
            Text(
              getDate(),
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    ));

    for (var lesson in lessons) {
      lessonTileList.add(LessonTile(inputLesson: lesson));
    }

    return lessonTileList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .02),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),

      // actual tile
      child: Column(
        children: createLessonTiles(context),
      ),
    );
  }
}
