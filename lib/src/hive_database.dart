import 'dart:convert';

import 'package:bettycook/src/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:bettycook/src/adapters/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveDatabase {
  late Box<TipHive> tipsBox;
  late Box<CategoryHive> categoriesBox;
  late Box<SubCategoryHive> subCategoriesBox;
  late Box<RecipeHive> recipesBox;
  late Box settingsBox;

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
    if (!Hive.isAdapterRegistered(SubCategoryHiveAdapter().typeId))
      Hive.registerAdapter(SubCategoryHiveAdapter());
    if (!Hive.isAdapterRegistered(RecipeHiveAdapter().typeId))
      Hive.registerAdapter(RecipeHiveAdapter());
    if (!Hive.isAdapterRegistered(IngredientHiveAdapter().typeId))
      Hive.registerAdapter(IngredientHiveAdapter());
    if (!Hive.isAdapterRegistered(IngredientsHiveAdapter().typeId))
      Hive.registerAdapter(IngredientsHiveAdapter());
    if (!Hive.isAdapterRegistered(PreparationHiveAdapter().typeId))
      Hive.registerAdapter(PreparationHiveAdapter());
  }

  // Open all boxes
  Future<void> _openBoxes() async {
    tipsBox = await Hive.openBox<TipHive>(tipsBoxKey,
        encryptionCipher: HiveAesCipher(encryptionKey));
    categoriesBox = await Hive.openBox<CategoryHive>(categoriesBoxKey,
        encryptionCipher: HiveAesCipher(encryptionKey));
    subCategoriesBox = await Hive.openBox<SubCategoryHive>(subCategoriesBoxKey,
        encryptionCipher: HiveAesCipher(encryptionKey));
    recipesBox = await Hive.openBox<RecipeHive>(recipesBoxKey,
        encryptionCipher: HiveAesCipher(encryptionKey));
    settingsBox = await Hive.openBox(settingsBoxKey,
        encryptionCipher: HiveAesCipher(encryptionKey));
  }

  // Compact all boxes
  Future<void> compactBoxes() async {
    await tipsBox.compact();
    await categoriesBox.compact();
    await subCategoriesBox.compact();
    await recipesBox.compact();
    await settingsBox.compact();
  }

  // ValueListenable of boxes (This is because the argumentBox.listenable() not is accesible outside of class)
  ValueListenable<Box<TipHive>> tipsBoxListable() => tipsBox.listenable();
  ValueListenable<Box<CategoryHive>> categoriesBoxListable() =>
      categoriesBox.listenable();
  ValueListenable<Box<SubCategoryHive>> subCategoriesBoxListable() =>
      subCategoriesBox.listenable();
  ValueListenable<Box<RecipeHive>> recipesBoxListable() =>
      recipesBox.listenable();
  ValueListenable<Box> settingsBoxListable() => settingsBox.listenable();
}
