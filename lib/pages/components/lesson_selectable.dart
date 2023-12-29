import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scheduler/pages/models/lesson.dart';

class SelectableLesson extends StatelessWidget {
  final Lesson inputLesson;
  const SelectableLesson({super.key, required this.inputLesson});

  String getStartTime() {
        switch (inputLesson.blockStart) {
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
        switch (inputLesson.blockEnd) {
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

  String dayOfTheWeekToString(dayOfTheWeek) {
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

  _onPressed() {

  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(50)
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(inputLesson.module, style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w500),),
                
                      Text(getStartTime(), style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w500),),
                      
                      Text(getEndTime(), style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w500),),
                    ],
                  ),
                ),
              ), 

              Expanded(
                flex: 5,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(inputLesson.prof, style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w500),),
                
                      Text(inputLesson.room, style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w500),),
                      
                      Text(dayOfTheWeekToString(inputLesson.dayOfTheWeek), style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w500),),
                    ],
                  ),
                ),
              ),

              Expanded(
                flex: 2,
                child: TextButton(
                  onPressed: _onPressed,
                
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18.0),
                    child: const Icon(Icons.add),
                  ),
                ),
                  
              )
            ],
          ),
        ),
      ),
    );
  }
}