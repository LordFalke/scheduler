import 'package:flutter/material.dart';

import 'pages/models/lesson.dart';

class Database {
  List selectableLessons = [];

  void createInitialData() {
    
    selectableLessons = [
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
        dayOfTheWeek: 0
      ),
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
      ),
    ];
  }
}