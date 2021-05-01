// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredients.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class IngredientsHiveAdapter extends TypeAdapter<IngredientsHive> {
  @override
  final int typeId = 5;

  @override
  IngredientsHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return IngredientsHive(
      amount: fields[0] as double,
      measure: fields[1] as String,
      ingredient: fields[2] as String,
      comment: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, IngredientsHive obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.amount)
      ..writeByte(1)
      ..write(obj.measure)
      ..writeByte(2)
      ..write(obj.ingredient)
      ..writeByte(3)
      ..write(obj.comment);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IngredientsHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
