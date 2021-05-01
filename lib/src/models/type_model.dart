class TypeModel {
  late int id;
  late String type;

  TypeModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    type = map['type'];
  }
}
