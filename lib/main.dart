import 'package:betsy_s_cookbook/src/app.dart';
import 'package:betsy_s_cookbook/src/constants.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(darkModeBox);
  runApp(App());
}
