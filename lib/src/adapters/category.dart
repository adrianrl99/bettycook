import 'package:hive/hive.dart';

part 'category.g.dart';

@HiveType(typeId: 1)
class CategoryHive extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;

  CategoryHive({required this.id, required this.name});
}
