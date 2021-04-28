import 'package:hive/hive.dart';

import 'adapters.dart';

part 'sub_category.g.dart';

@HiveType(typeId: 2)
class SubCategoryHive extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  CategoryHive category;

  SubCategoryHive({required this.name, required this.category});
}
