// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tip.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TipHiveAdapter extends TypeAdapter<TipHive> {
  @override
  final int typeId = 0;

  @override
  TipHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TipHive(
      tip: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TipHive obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.tip);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TipHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
