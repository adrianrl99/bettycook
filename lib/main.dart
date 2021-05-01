import 'package:bettycook/src/app.dart';
import 'package:bettycook/src/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  await hiveDB.init();
  await db.init();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(App());
}
