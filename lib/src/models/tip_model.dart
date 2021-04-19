class TipModel {
  late int id;
  late String tip;

  TipModel(this.id, this.tip);

  TipModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    tip = map['tip'];
  }
}
