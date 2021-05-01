// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecipeHiveAdapter extends TypeAdapter<RecipeHive> {
  @override
  final int typeId = 3;

  @override
  RecipeHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecipeHive(
      id: fields[0] as int,
      title: fields[1] as String,
      ingredients: (fields[2] as List).cast<IngredientHive>(),
      preparation: (fields[3] as List).cast<PreparationHive>(),
      subcategory: fields[4] as SubCategoryHive,
      image: fields[9] == null ? '' : fields[9] as String,
    )
      ..favorite = fields[5] == null ? false : fields[5] as bool
      ..calendar = fields[6] == null ? [] : (fields[6] as List).cast<DateTime>()
      ..notes = fields[7] == null ? [] : (fields[7] as List).cast<String>()
      ..rating = fields[8] == null ? 0 : fields[8] as double;
  }

  @override
  void write(BinaryWriter writer, RecipeHive obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.ingredients)
      ..writeByte(3)
      ..write(obj.preparation)
      ..writeByte(4)
      ..write(obj.subcategory)
      ..writeByte(5)
      ..write(obj.favorite)
      ..writeByte(6)
      ..write(obj.calendar)
      ..writeByte(7)
      ..write(obj.notes)
      ..writeByte(8)
      ..write(obj.rating)
      ..writeByte(9)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecipeHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
