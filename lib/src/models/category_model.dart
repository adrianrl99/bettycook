class CategoryModel {
  int id;
  String name;

  CategoryModel(this.id, this.name);

  CategoryModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
  }
}
