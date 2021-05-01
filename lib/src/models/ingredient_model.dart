class IngredientModel {
  late String target;
  List<IngredientsModel> ingredients = [];

  IngredientModel.fromMap(Map<String, dynamic> map) {
    target = map['target'];
    map["ingredients"]
        .map((_map) => IngredientsModel.fromMap(_map))
        .toList()
        .forEach((i) => ingredients.add(i));
  }
}

class IngredientsModel {
  late double amount;
  late String measure;
  late String ingredient;
  late String comment;

  IngredientsModel.fromMap(Map<String, dynamic> map) {
    amount = double.parse(map['amount']);
    measure = map['measure'];
    ingredient = map['ingredient'];
    comment = map['comment'];
  }
}
