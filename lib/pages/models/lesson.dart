import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'empty_lesson.dart';

part 'lesson.g.dart';

@HiveType(typeId: 1)
class Lesson {
  @HiveField(0)
  final String module;
  @HiveField(1)
  final String topic;
  @HiveField(2)
  final bool isLab;
  @HiveField(3)
  final String labGroup;
  @HiveField(4)
  final String prof;
  @HiveField(5)
  final String room;
  @HiveField(6)
  final int blockStart;
  @HiveField(7)
  final int blockEnd;
  // final String start;
  // final String end;
  @HiveField(8)
  final int color;
  @HiveField(9)
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