library config.globals;

import 'package:bettycook/src/constants.dart';
import 'package:bettycook/src/database.dart';
import 'package:bettycook/src/hive_database.dart';
import 'package:hive/hive.dart';

// Databases
RecipesDatabase db = RecipesDatabase();
HiveDatabase hiveDB = HiveDatabase();

// Hive Boxes
Box settingsBox = Hive.box(settingsBoxKey);
