// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class IngredientHiveAdapter extends TypeAdapter<IngredientHive> {
  @override
  final int typeId = 4;

  @override
  IngredientHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return IngredientHive(
      target: fields[0] as String,
      ingredients: (fields[1] as List).cast<IngredientsHive>(),
    );
  }

  @override
  void write(BinaryWriter writer, IngredientHive obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.target)
      ..writeByte(1)
      ..write(obj.ingredients);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IngredientHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
