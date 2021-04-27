import 'package:hive/hive.dart';

part 'category.g.dart';

@HiveType(typeId: 1)
class CategoryHive extends HiveObject {
  @HiveField(0)
  String name;

  CategoryHive(this.name);
}
