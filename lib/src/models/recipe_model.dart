class RecipeModel {
  late int id;
  late String title;
  late String details;
  late String ingredients;
  late String preparation;
  late int category;
  late int subcategory;

  // Basic constructors
  RecipeModel.basic(this.id, this.title);
  RecipeModel.fromMapBasic(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];
  }

  // Full constructors
  RecipeModel(this.id, this.title, this.details, this.ingredients,
      this.preparation, this.category, this.subcategory);
  RecipeModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];
    details = map['details'];
    ingredients = map['ingredientes'];
    preparation = map['preparation'];
    category = map['category'];
    subcategory = map['subcategory'];
  }
}
