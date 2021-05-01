import 'package:hive/hive.dart';

part 'type.g.dart';

@HiveType(typeId: 1)
class TypeHive extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String type;

  TypeHive({required this.id, required this.type});
}
