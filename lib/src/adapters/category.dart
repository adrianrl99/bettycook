import 'package:hive/hive.dart';

part 'category.g.dart';

@HiveType(typeId: 1)
class CategoryHive extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2, defaultValue: "")
  final String image;

  CategoryHive({required this.id, required this.name, required this.image});
}
