import 'package:bettycook/src/app.dart';
import 'package:bettycook/src/constants.dart';
import 'package:bettycook/src/database.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await Future.wait(boxes.map((String box) async {
    if (!Hive.isBoxOpen(box)) await Hive.openBox(box);
  }));
  await RecipesDatabase().initDB();
  runApp(App());
}
