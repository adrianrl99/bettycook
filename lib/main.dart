import 'package:bettycook/src/app.dart';
import 'package:bettycook/src/config.dart';
import 'package:flutter/material.dart';

void main() async {
  await hiveDB.init();
  await db.init();
  runApp(App());
}
