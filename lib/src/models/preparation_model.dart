class PreparationModel {
  late String target;
  List<String> preparation = [];

  PreparationModel({required this.target, required this.preparation});

  PreparationModel.fromMap(Map<String, dynamic> map) {
    target = map['target'];
    map["preparation"].forEach((i) => preparation.add(i));
  }
}
