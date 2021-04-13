class RecipeModel {
  int id;
  String title;
  String details;
  String ingredients;
  String preparation;
  int category;
  int subcategory;

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
