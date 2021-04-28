import 'package:hive/hive.dart';

part 'preparation.g.dart';

@HiveType(typeId: 6)
class PreparationHive {
  @HiveField(0)
  String target;
  @HiveField(1)
  List<String> preparation;

  PreparationHive({required this.target, required this.preparation});
}
