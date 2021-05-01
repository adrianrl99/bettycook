import 'package:hive/hive.dart';

part 'tip.g.dart';

@HiveType(typeId: 0)
class TipHive extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String tip;

  TipHive({required this.id, required this.tip});
}
