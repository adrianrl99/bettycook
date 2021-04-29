import 'package:hive/hive.dart';

import 'adapters.dart';

part 'recipe.g.dart';

@HiveType(typeId: 3)
class RecipeHive extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  List<IngredientHive> ingredients;
  @HiveField(2)
  List<PreparationHive> preparation;
  @HiveField(3)
  SubCategoryHive subcategory;
  @HiveField(4)
  bool favorite = false;
  @HiveField(5)
  List<DateTime> calendar = [];
  @HiveField(6)
  List<String> notes = [];

  RecipeHive(
      {required this.title,
      required this.ingredients,
      required this.preparation,
      required this.subcategory});
}
