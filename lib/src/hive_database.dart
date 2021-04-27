import 'package:bettycook/src/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:bettycook/src/adapters/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveDatabase {
  late Box<TipHive> tipsBox;
  late Box<CategoryHive> categoriesBox;

  // Initialize hive flutter database, register all adapters and open all boxes
  Future<void> init() async {
    await Hive.initFlutter();
    _registerAdapters();
    await _openBoxes();
  }

  // Register all adapters
  void _registerAdapters() {
    if (!Hive.isAdapterRegistered(TipHiveAdapter().typeId))
      Hive.registerAdapter(TipHiveAdapter());
    if (!Hive.isAdapterRegistered(CategoryHiveAdapter().typeId))
      Hive.registerAdapter(CategoryHiveAdapter());
  }

  // Open all boxes
  Future<void> _openBoxes() async {
    tipsBox = await Hive.openBox<TipHive>(tipsBoxKey);
    categoriesBox = await Hive.openBox<CategoryHive>(categoriesBoxKey);
  }

  // Compact all boxes
  Future<void> compactBoxes() async {
    await tipsBox.compact();
    await categoriesBox.compact();
  }

  // ValueListenable of boxes (This is because the argumentBox.listenable() not is accesible outside of class)
  ValueListenable<Box<TipHive>> tipsBoxListable() => tipsBox.listenable();
  ValueListenable<Box<CategoryHive>> categoriesBoxListable() =>
      categoriesBox.listenable();
}
