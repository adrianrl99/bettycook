class PreparationModel {
  late String target;
  List<String> preparation = [];

  PreparationModel.fromMap(Map<String, dynamic> map) {
    target = map['target'];
    map["preparation"].forEach((i) => preparation.add(i));
  }
}
