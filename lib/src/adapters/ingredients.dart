import 'package:bettycook/src/adapters/adapters.dart';
import 'package:hive/hive.dart';

part 'ingredients.g.dart';

@HiveType(typeId: 5)
class IngredientsHive {
  @HiveField(0)
  final double amount;
  @HiveField(1)
  final String measure;
  @HiveField(2)
  final String ingredient;
  @HiveField(3)
  final String comment;

  IngredientsHive({
    required this.amount,
    required this.measure,
    required this.ingredient,
    required this.comment,
  });
}
