import 'package:flutter/material.dart';

import 'empty_lesson.dart';

class Lesson extends EmptyLesson{
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

  final Color color;

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
    }
  ) : super();
}