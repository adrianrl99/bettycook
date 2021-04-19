class CategoryModel {
  late int id;
  late String name;

  CategoryModel(this.id, this.name);

  CategoryModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
  }
}
