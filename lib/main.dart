import 'package:bettycook/src/app.dart';
import 'package:bettycook/src/config.dart';
import 'package:bettycook/src/constants.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

void main() async {
  await hiveDB.init();
  await db.init();
  await Future.wait(boxes.map((String box) async {
    if (!Hive.isBoxOpen(box)) await Hive.openBox(box);
  }));
  runApp(App());
}
