import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'pages/models/lesson.dart';

class Database {
  List selectableLessons = [];
  List selectedLessons = [];
  List selectedLabs = [];

  final _myBox = Hive.box("stored_lessons");

  void createInitialData() {
    selectedLabs = [
      Lesson(module: "ISI", topic: "Labor Z", isLab: true, labGroup: "Z", prof: "Kathmann", room: "I222", blockStart: 2, blockEnd: 4, color: Colors.deepOrange.shade300.value, dayOfTheWeek: 1),
    ];
    selectedLessons = [
      Lesson(
          module: "ISI",
          topic: "Vorlesung",
          isLab: false,
          labGroup: "none",
          prof: "Sethmann",
          room: "I122",
          blockStart: 1,
          blockEnd: 2,
          color: Colors.deepOrange.shade300.value,
          dayOfTheWeek: 0,
          labs: [
            Lesson(module: "ISI", topic: "Labor Z", isLab: true, labGroup: "Z", prof: "Kathmann", room: "I222", blockStart: 2, blockEnd: 4, color: Colors.deepOrange.shade300.value, dayOfTheWeek: 1),
            Lesson(module: "ISI", topic: "Labor Y", isLab: true, labGroup: "Y", prof: "GEN_ZAN", room: "I222", blockStart: 2, blockEnd: 4, color: Colors.deepOrange.shade300.value, dayOfTheWeek: 0),
            Lesson(module: "ISI", topic: "Labor X", isLab: true, labGroup: "X", prof: "GEN_ZAN", room: "I222", blockStart: 2, blockEnd: 4, color: Colors.deepOrange.shade300.value, dayOfTheWeek: 0),
            ]),
    ];
    selectableLessons = [
      Lesson(
        module: "MFORM",
        topic: "Vorlesung",
        isLab: false,
        labGroup: "none",
        prof: "Krug",
        room: "I012",
        blockStart: 0,
        blockEnd: 1,
        color: Colors.blue.shade300.value,
        dayOfTheWeek: 1,
        labs: [
          Lesson(module: "MFORM", topic: "Labor Z", isLab: true, labGroup: "Z", prof: "Krug", room: "I234", blockStart: 1, blockEnd: 2, color: Colors.blue.shade300.value, dayOfTheWeek: 1),
          Lesson(module: "MFORM", topic: "Labor Y", isLab: true, labGroup: "Y", prof: "Krug", room: "I234", blockStart: 2, blockEnd: 3, color: Colors.blue.shade300.value, dayOfTheWeek: 1),
          Lesson(module: "MFORM", topic: "Labor X", isLab: true, labGroup: "X", prof: "Krug", room: "I234", blockStart: 3, blockEnd: 4, color: Colors.blue.shade300.value, dayOfTheWeek: 1),
        ]
      ),
      Lesson(
        module: "SWT",
        topic: "Vorlesung",
        isLab: false,
        labGroup: "none",
        prof: "Teschke",
        room: "I032C",
        blockStart: 1,
        blockEnd: 2,
        color: Colors.deepPurple.shade300.value,
        dayOfTheWeek: 2,
        labs: [
          Lesson(module: "SWT", topic: "Labor Z", isLab: true, labGroup: "Z", prof: "Teschke", room: "I032C", blockStart: 3, blockEnd: 5, color: Colors.deepPurple.shade300.value, dayOfTheWeek: 3),
          Lesson(module: "SWT", topic: "Labor Y", isLab: true, labGroup: "Y", prof: "Teschke", room: "I032C", blockStart: 3, blockEnd: 5, color: Colors.deepPurple.shade300.value, dayOfTheWeek: 2),
          Lesson(module: "SWT", topic: "Labor X", isLab: true, labGroup: "X", prof: "Teschke", room: "I032C", blockStart: 3, blockEnd: 5, color: Colors.deepPurple.shade300.value, dayOfTheWeek: 2),
        ]
      ),
      Lesson(
        module: "HCI",
        topic: "Vorlesung",
        isLab: false,
        labGroup: "none",
        prof: "Paelke",
        room: "I012",
        blockStart: 2,
        blockEnd: 3,
        color: Colors.green.shade300.value,
        dayOfTheWeek: 3,
        labs: [
          Lesson(module: "HCI", topic: "Labor Z", isLab: true, labGroup: "Z", prof: "Paelke", room: "I220", blockStart: 1, blockEnd: 2, color: Colors.green.shade300.value, dayOfTheWeek: 3),
          Lesson(module: "HCI", topic: "Labor X", isLab: true, labGroup: "X", prof: "Paelke", room: "I220", blockStart: 3, blockEnd: 4, color: Colors.green.shade300.value, dayOfTheWeek: 3),
          Lesson(module: "HCI", topic: "Labor Y", isLab: true, labGroup: "Y", prof: "Paelke", room: "I220", blockStart: 4, blockEnd: 5, color: Colors.green.shade300.value, dayOfTheWeek: 3),
        ]
      ),
      Lesson(
        module: "WPM",
        topic: "Projekt",
        isLab: false,
        labGroup: "none",
        prof: "Verschiedene",
        room: "Verschiedene",
        blockStart: 1,
        blockEnd: 4,
        color: Colors.red.shade300.value,
        dayOfTheWeek: 4,
        labs: []
      ),
      Lesson(
        module: "MI1",
        topic: "Vorlesung",
        isLab: false,
        labGroup: "none",
        prof: "Tannert",
        room: "I032B",
        blockStart: 0,
        blockEnd: 1,
        color: Colors.cyan.shade300.value,
        dayOfTheWeek: 1,
        labs: [
          Lesson(module: "MI1", topic: "Labor A", isLab: true, labGroup: "A", prof: "Tannert", room: "I221", blockStart: 1, blockEnd: 2, color: Colors.cyan.shade300.value, dayOfTheWeek: 1),
          Lesson(module: "MI1", topic: "Labor B", isLab: true, labGroup: "B", prof: "Tannert", room: "I221", blockStart: 2, blockEnd: 3, color: Colors.cyan.shade300.value, dayOfTheWeek: 1),
          Lesson(module: "MI1", topic: "Labor C", isLab: true, labGroup: "C", prof: "Tannert", room: "I221", blockStart: 3, blockEnd: 4, color: Colors.cyan.shade300.value, dayOfTheWeek: 1),
        ]
      ),
      Lesson(
        module: "MATHE1",
        topic: "Vorlesung",
        isLab: false,
        labGroup: "none",
        prof: "HBertram",
        room: "I012",
        blockStart: 1,
        blockEnd: 2,
        color: Colors.indigo.shade300.value,
        dayOfTheWeek: 0,
        labs: [
          Lesson(module: "MATHE1", topic: "Labor A", isLab: true, labGroup: "A", prof: "HBertram", room: "I220", blockStart: 0, blockEnd: 1, color: Colors.indigo.shade300.value, dayOfTheWeek: 0),
          Lesson(module: "MATHE1", topic: "Labor B", isLab: true, labGroup: "B", prof: "HBertram", room: "I220", blockStart: 2, blockEnd: 3, color: Colors.indigo.shade300.value, dayOfTheWeek: 0),
          Lesson(module: "MATHE1", topic: "Labor C", isLab: true, labGroup: "C", prof: "HBertram", room: "I220", blockStart: 3, blockEnd: 4, color: Colors.indigo.shade300.value, dayOfTheWeek: 0),
        ]
      ),
      Lesson(
        module: "INF1",
        topic: "Vorlesung",
        isLab: false,
        labGroup: "none",
        prof: "Eirund",
        room: "I032B",
        blockStart: 1,
        blockEnd: 2,
        color: Colors.amber.shade300.value,
        dayOfTheWeek: 2,
        labs: [
          Lesson(module: "INF1", topic: "Labor A", isLab: true, labGroup: "A", prof: "Eirund", room: "I221", blockStart: 2, blockEnd: 3, color: Colors.amber.shade300.value, dayOfTheWeek: 2),
          Lesson(module: "INF1", topic: "Labor B", isLab: true, labGroup: "B", prof: "Eirund", room: "I221", blockStart: 3, blockEnd: 4, color: Colors.amber.shade300.value, dayOfTheWeek: 2),
          Lesson(module: "INF1", topic: "Labor C", isLab: true, labGroup: "C", prof: "Eirund", room: "I220", blockStart: 2, blockEnd: 3, color: Colors.amber.shade300.value, dayOfTheWeek: 3),
        ]
      ),
      Lesson(
        module: "PROG1",
        topic: "Vorlesung",
        isLab: false,
        labGroup: "none",
        prof: "Eirund",
        room: "I012",
        blockStart: 1,
        blockEnd: 2,
        color: Colors.orange.shade300.value,
        dayOfTheWeek: 3,
        labs: [
          Lesson(module: "PROG1", topic: "Labor A", isLab: true, labGroup: "A", prof: "Eirund", room: "I221", blockStart: 2, blockEnd: 4, color: Colors.orange.shade300.value, dayOfTheWeek: 3),
          Lesson(module: "PROG1", topic: "Labor B", isLab: true, labGroup: "B", prof: "Eirund", room: "I221", blockStart: 2, blockEnd: 4, color: Colors.orange.shade300.value, dayOfTheWeek: 3),
          Lesson(module: "PROG1", topic: "Labor C", isLab: true, labGroup: "C", prof: "Eirund", room: "I032C", blockStart: 2, blockEnd: 4, color: Colors.orange.shade300.value, dayOfTheWeek: 3),
        ]
      ),
      Lesson(
        module: "GEST1",
        topic: "Vorlesung",
        isLab: false,
        labGroup: "none",
        prof: "Teufel",
        room: "E509",
        blockStart: 1,
        blockEnd: 2,
        color: Colors.purple.shade300.value,
        dayOfTheWeek: 4,
        labs: [
          Lesson(module: "GEST1", topic: "Labor AB", isLab: true, labGroup: "AB", prof: "Hölscher", room: "E405", blockStart: 2, blockEnd: 3, color: Colors.purple.shade300.value, dayOfTheWeek: 4),
          Lesson(module: "GEST1", topic: "Labor CD", isLab: true, labGroup: "CD", prof: "Teufel", room: "E406", blockStart: 2, blockEnd: 3, color: Colors.purple.shade300.value, dayOfTheWeek: 4),

        ]
      ),
      Lesson(
        module: "ENGL1",
        topic: "Labor",
        isLab: false,
        labGroup: "Z",
        prof: "Shillington",
        room: "online",
        blockStart: 3,
        blockEnd: 5,
        color: Colors.green.shade300.value,
        dayOfTheWeek: 2,
        labs: []
      ),
    ];
    updateData();
    updateLabs();
    updateSelected();
  }

  void loadData() {
    selectableLessons = _myBox.get("selectable_lessons");
  }

  void updateData() {
    _myBox.put("selectable_lessons", selectableLessons);
  }

  void loadSelected() {
    if (_myBox.get("selected_lessons") != null) {
      selectedLessons = _myBox.get("selected_lessons");
    }
  }

  void updateSelected() {
    _myBox.put("selected_lessons", selectedLessons);
  }

  void loadLabs() {
    if (_myBox.get("selected_labs") != null) {
      selectedLabs = _myBox.get("selected_labs");
    }
  }

  void updateLabs() {
    _myBox.put("selected_labs", selectedLabs);
  }

  void clearSelected() {
    selectedLessons = [];
    selectedLabs = [];
    updateSelected();
    updateLabs();
  }

  void deleteDatabase() {
    _myBox.deleteFromDisk();
  }
}
