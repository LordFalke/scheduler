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

  _addSelected(labGroup) {
    db.selectedLessons.add(inputLesson);
    db.selectableLessons.remove(inputLesson);

    Lesson selectedLab = inputLesson.labs![labGroup];
    db.selectedLabs.add(selectedLab);


    db.updateSelected();
    db.updateData();
    refreshPage();
    refreshMenu();
  }

  _addOnlyLecture() {
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
          child: Row(children: [
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
            Expanded(
              flex: 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  inputLesson.labs != null ? inputLesson.labs!.length : 0,
                  (index) {
                    return GestureDetector(
                      onTap: () {
                        _addSelected(index);
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        width: inputLesson.labs!.length > 2 && index == 1
                            ? 30
                            : 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(index == 0 ? 20 : 0),
                            bottomLeft: Radius.circular(index == 0 ? 20 : 0),
                            topRight: Radius.circular(
                                index == inputLesson.labs!.length - 1 ? 20 : 0),
                            bottomRight: Radius.circular(
                                index == inputLesson.labs!.length - 1 ? 20 : 0),
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            inputLesson.labs![index].labGroup,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
