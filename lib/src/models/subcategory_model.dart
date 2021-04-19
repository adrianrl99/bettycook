class SubCategoryModel {
  late int id;
  late String name;
  late int category;

  SubCategoryModel(this.id, this.name, this.category);

  SubCategoryModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    category = map["category"];
  }
}
