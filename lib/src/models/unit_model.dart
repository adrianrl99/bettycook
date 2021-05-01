class UnitModel {
  late int id;
  late String name;
  late String abbr;
  late int type;

  UnitModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    abbr = map['abbr'];
    type = map['type'];
  }
}
