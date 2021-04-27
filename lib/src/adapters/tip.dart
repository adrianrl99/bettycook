import 'package:hive/hive.dart';

part 'tip.g.dart';

@HiveType(typeId: 0)
class TipHive extends HiveObject {
  @HiveField(0)
  String tip;

  TipHive(this.tip);
}
