import "package:flutter/material.dart" hide BoxDecoration, BoxShadow;
import "package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart";
import "package:google_fonts/google_fonts.dart";
import "package:scheduler/pages/models/empty_lesson.dart";

import "../models/lesson.dart";

class LessonTile extends StatelessWidget {
  final Object inputLesson;
  LessonTile({super.key, required this.inputLesson});

  @override
  Widget build(BuildContext context) {
    if (inputLesson is Lesson) {
      Lesson lesson = inputLesson as Lesson;

      double getHeight() {
        switch (lesson.blockEnd - lesson.blockStart) {
          case 2:
            return 220;
          case 3:
            return 340;
          case 4:
            return 460;
          case 5:
            return 580;
          default:
            return 100;
        }
      }

      String getStartTime() {
        switch (lesson.blockStart) {
          case 0:
            return "8:00";
          case 1:
            return "9:45";
          case 2:
            return "11:30";
          case 3:
            return "13:30";
          case 4:
            return "15:15";
          case 5:
            return "17:00";
          case 6:
            return "18:45";
          case 7:
            return "20:15";
          default:
            return "8:00";
        }
      }

      String getEndTime() {
        switch (lesson.blockEnd) {
          case 1:
            return "9:30";
          case 2:
            return "11:15";
          case 3:
            return "13:00";
          case 4:
            return "15:00";
          case 5:
            return "16:45";
          case 6:
            return "18:30";
          case 7:
            return "20:15";
          case 8:
            return "21:45";
          default:
            return "9:30";
        }
      }

      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Container(
          width: MediaQuery.of(context).size.width * .8,
          height: lesson.blockEnd-lesson.blockStart > 1 ? 120.0*(lesson.blockEnd-lesson.blockStart)-20 : 100.0,
          decoration: BoxDecoration(
              color: Color(lesson.color),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(0, 10),
                )
              ]),
          child: Padding(
            padding: const EdgeInsets.all(5.0),

            // inner elements
            child: Row(
              children: [
                // 1st lesson
                // time container
                Expanded(
                  flex: 4,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          // BoxShadow(
                          //     color: Colors.red,
                          //     inset: true,
                          //     offset: Offset(0, -10)),
                          BoxShadow(
                              color: Colors.grey.shade200,
                              inset: true,
                              offset: Offset(5, 5)),
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // SizedBox(height: 15,),

                        // module name
                        Text(
                          lesson.module,
                          style: GoogleFonts.inter(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),

                        // lesson start time
                        Text(
                          getStartTime(),
                          style: GoogleFonts.inter(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),

                        // lesson end time
                        Text(
                          getEndTime(),
                          style: GoogleFonts.inter(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),

                // data container
                Expanded(
                  flex: 6,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // lesson topic
                        Text(
                          lesson.topic,
                          style: GoogleFonts.inter(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),

                        // prof
                        Text(
                          lesson.prof,
                          style: GoogleFonts.inter(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),

                        // room
                        Text(
                          lesson.room,
                          style: GoogleFonts.inter(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Container(
          width: MediaQuery.of(context).size.width * .8,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                offset: Offset(0, 10),
              )
            ],
          ),
        ),
      );
    }
  }
}
