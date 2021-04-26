class IngredientModel {
  late String target;
  List<IngredientsModel> ingredients = [];

  IngredientModel({required this.target, required this.ingredients});

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

  IngredientsModel(
      {required this.amount,
      required this.measure,
      required this.ingredient,
      required this.comment});

  IngredientsModel.fromMap(Map<String, dynamic> map) {
    amount = double.parse(map['amount']);
    measure = map['measure'];
    ingredient = map['ingredient'];
    comment = map['comment'];
  }
}
