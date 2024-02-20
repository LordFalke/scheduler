// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LessonAdapter extends TypeAdapter<Lesson> {
  @override
  final int typeId = 1;

  @override
  Lesson read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Lesson(
      module: fields[0] as String,
      topic: fields[1] as String,
      isLab: fields[2] as bool,
      labGroup: fields[3] as String,
      prof: fields[4] as String,
      room: fields[5] as String,
      blockStart: fields[6] as int,
      blockEnd: fields[7] as int,
      color: fields[8] as int,
      dayOfTheWeek: fields[9] as int,
      labs: (fields[10] as List?)?.cast<dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, Lesson obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.module)
      ..writeByte(1)
      ..write(obj.topic)
      ..writeByte(2)
      ..write(obj.isLab)
      ..writeByte(3)
      ..write(obj.labGroup)
      ..writeByte(4)
      ..write(obj.prof)
      ..writeByte(5)
      ..write(obj.room)
      ..writeByte(6)
      ..write(obj.blockStart)
      ..writeByte(7)
      ..write(obj.blockEnd)
      ..writeByte(8)
      ..write(obj.color)
      ..writeByte(9)
      ..write(obj.dayOfTheWeek)
      ..writeByte(10)
      ..write(obj.labs);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LessonAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
