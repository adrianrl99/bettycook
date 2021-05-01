import 'package:hive/hive.dart';

import 'adapters.dart';

part 'sub_category.g.dart';

@HiveType(typeId: 2)
class SubCategoryHive extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final CategoryHive category;
  @HiveField(3, defaultValue: "")
  final String image;

  SubCategoryHive(
      {required this.id,
      required this.name,
      required this.category,
      required this.image});
}
