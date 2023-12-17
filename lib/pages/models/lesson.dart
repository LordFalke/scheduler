import 'package:flutter/material.dart';

import 'empty_lesson.dart';

class Lesson {
  final String module;
  final String topic;

  final bool isLab;
  final String labGroup;

  final String prof;
  final String room;

  final int blockStart;
  final int blockEnd;
  // final String start;
  // final String end;

  final int color;
  int dayOfTheWeek;

  Lesson( 
    {
      required this.module, 
      required this.topic, 
      required this.isLab, 
      required this.labGroup, 
      required this.prof, 
      required this.room, 
      required this.blockStart, 
      required this.blockEnd,
      // required this.start, 
      // required this.end,
      required this.color,
      required this.dayOfTheWeek,
    }
  ) : super();
}