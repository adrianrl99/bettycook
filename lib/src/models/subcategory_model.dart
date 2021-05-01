class SubCategoryModel {
  late int id;
  late String name;
  late int category;
  late String image;

  SubCategoryModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    category = map["category"];
    image = map["image"];
  }
}
