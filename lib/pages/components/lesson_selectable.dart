import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:scheduler/database.dart';
import 'package:scheduler/pages/models/lesson.dart';

class SelectableLesson extends StatelessWidget {
  Database db;
  final Lesson inputLesson;
  VoidCallback refreshPage;
  VoidCallback refreshMenu;
  SelectableLesson({
    super.key,
    required this.inputLesson,
    required this.db,
    required this.refreshPage,
    required this.refreshMenu,
  });

  _addSelected() {
    db.selectedLessons.add(inputLesson);
    db.selectableLessons.remove(inputLesson);
    db.updateSelected();
    db.updateData();
    refreshPage();
    refreshMenu();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
            color: Color(inputLesson.color),
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                offset: Offset(0, 10),
              ),
            ]),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        inputLesson.prof,
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        inputLesson.room,
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        inputLesson.module,
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              TextButton(
                onPressed: _addSelected,
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  fixedSize: MaterialStateProperty.all(Size(64, 64)),
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
