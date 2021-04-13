class SubCategoryModel {
  int id;
  String name;
  int category;

  SubCategoryModel(this.id, this.name, this.category);

  SubCategoryModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    category = map["category"];
  }
}
