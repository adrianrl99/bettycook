import 'package:hive/hive.dart';

import 'adapters.dart';

part 'recipe.g.dart';

@HiveType(typeId: 3)
class RecipeHive extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final List<IngredientHive> ingredients;
  @HiveField(3)
  final List<PreparationHive> preparation;
  @HiveField(4)
  final SubCategoryHive subcategory;
  @HiveField(5, defaultValue: false)
  bool favorite = false;
  @HiveField(6, defaultValue: [])
  List<DateTime> calendar = [];
  @HiveField(7, defaultValue: [])
  List<String> notes = [];
  @HiveField(8, defaultValue: 0)
  double rating = 0;

  RecipeHive(
      {required this.id,
      required this.title,
      required this.ingredients,
      required this.preparation,
      required this.subcategory});
}
