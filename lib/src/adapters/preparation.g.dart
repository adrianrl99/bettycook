// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preparation.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PreparationHiveAdapter extends TypeAdapter<PreparationHive> {
  @override
  final int typeId = 6;

  @override
  PreparationHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PreparationHive(
      target: fields[0] as String,
      preparation: (fields[1] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, PreparationHive obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.target)
      ..writeByte(1)
      ..write(obj.preparation);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PreparationHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
