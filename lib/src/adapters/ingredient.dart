import 'package:hive/hive.dart';

import 'adapters.dart';

part 'ingredient.g.dart';

@HiveType(typeId: 4)
class IngredientHive {
  @HiveField(0)
  final String target;
  @HiveField(1)
  final List<IngredientsHive> ingredients;

  IngredientHive({required this.target, required this.ingredients});
}
