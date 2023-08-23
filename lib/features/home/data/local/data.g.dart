// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskAdapter extends TypeAdapter<Task> {
  @override
  final int typeId = 0;

  @override
  Task read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Task()
      ..name = fields[0] as String
      ..isComleted = fields[1] as bool
      ..proirity = fields[2] as int
      ..dateTime = fields[3] as DateTime
      ..description = fields[4] as String
      ..category = fields[5] as Category;
  }

  @override
  void write(BinaryWriter writer, Task obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.isComleted)
      ..writeByte(2)
      ..write(obj.proirity)
      ..writeByte(3)
      ..write(obj.dateTime)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.category);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CategoryAdapter extends TypeAdapter<Category> {
  @override
  final int typeId = 2;

  @override
  Category read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Category.Home;
      case 1:
        return Category.university;
      case 2:
        return Category.work;
      case 3:
        return Category.sport;
      case 4:
        return Category.Music;
      case 5:
        return Category.health;
      default:
        return Category.Home;
    }
  }

  @override
  void write(BinaryWriter writer, Category obj) {
    switch (obj) {
      case Category.Home:
        writer.writeByte(0);
        break;
      case Category.university:
        writer.writeByte(1);
        break;
      case Category.work:
        writer.writeByte(2);
        break;
      case Category.sport:
        writer.writeByte(3);
        break;
      case Category.Music:
        writer.writeByte(4);
        break;
      case Category.health:
        writer.writeByte(5);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
