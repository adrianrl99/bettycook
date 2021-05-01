// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TypeHiveAdapter extends TypeAdapter<TypeHive> {
  @override
  final int typeId = 1;

  @override
  TypeHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TypeHive(
      id: fields[0] as int,
      type: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TypeHive obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TypeHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
