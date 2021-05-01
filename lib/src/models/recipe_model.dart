import 'dart:convert';

import 'package:bettycook/src/models/models.dart';

class RecipeModel {
  late int id;
  late String title;
  List<IngredientModel> ingredients = [];
  List<PreparationModel> preparation = [];
  late int category;
  late int subcategory;
  late String image;

  // Full constructors
  RecipeModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];
    jsonDecode(map["ingredients"])
        .map((_map) => IngredientModel.fromMap(_map))
        .toList()
        .forEach((i) => ingredients.add(i));
    jsonDecode(map["preparation"])
        .map((_map) => PreparationModel.fromMap(_map))
        .toList()
        .forEach((i) => preparation.add(i));

    // preparation = map['preparation'];
    category = map['category'];
    subcategory = map['subcategory'];
    image = map['image'];
  }
}
