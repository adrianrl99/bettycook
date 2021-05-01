import 'package:bettycook/src/adapters/adapters.dart';
import 'package:hive/hive.dart';

part 'measure.g.dart';

@HiveType(typeId: 1)
class MeasureHive extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String abbr;
  @HiveField(3)
  final TypeHive type;

  MeasureHive({
    required this.id,
    required this.name,
    required this.abbr,
    required this.type,
  });
}
