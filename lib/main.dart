import 'package:betsy_s_cookbook/src/app.dart';
import 'package:betsy_s_cookbook/src/constants.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  if (!Hive.isBoxOpen(settingsBox)) await Hive.openBox(settingsBox);
  if (!Hive.isBoxOpen(favoritesBox)) await Hive.openBox(favoritesBox);
  runApp(App());
}
