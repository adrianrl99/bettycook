class CategoryModel {
  late int id;
  late String name;
  late String image;

  CategoryModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    image = map['image'];
  }
}
