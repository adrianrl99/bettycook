import 'package:bettycook/src/app.dart';
import 'package:bettycook/src/constants.dart';
import 'package:bettycook/src/database.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  if (!Hive.isBoxOpen(settingsBox)) await Hive.openBox(settingsBox);
  if (!Hive.isBoxOpen(favoritesBox)) await Hive.openBox(favoritesBox);
  if (!Hive.isBoxOpen(tipsBox)) await Hive.openBox(tipsBox);
  await RecipesDatabase().initDB();
  runApp(App());
}
