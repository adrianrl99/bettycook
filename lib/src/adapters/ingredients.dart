import 'package:hive/hive.dart';

part 'ingredients.g.dart';

@HiveType(typeId: 5)
class IngredientsHive {
  @HiveField(0)
  double amount;
  @HiveField(1)
  String measure;
  @HiveField(2)
  String ingredient;
  @HiveField(3)
  String comment;

  IngredientsHive(
      {required this.amount,
      required this.measure,
      required this.ingredient,
      required this.comment});
}
