// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'measure.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MeasureHiveAdapter extends TypeAdapter<MeasureHive> {
  @override
  final int typeId = 1;

  @override
  MeasureHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MeasureHive(
      id: fields[0] as int,
      name: fields[1] as String,
      abbr: fields[2] as String,
      type: fields[3] as TypeHive,
    );
  }

  @override
  void write(BinaryWriter writer, MeasureHive obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.abbr)
      ..writeByte(3)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MeasureHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
