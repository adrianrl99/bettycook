import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:bettycook/src/adapters/adapters.dart';
import 'package:bettycook/src/config.dart';
import 'package:bettycook/src/constants.dart';
import 'package:bettycook/src/models/ingredient_model.dart';
import 'package:bettycook/src/models/models.dart';
import 'package:flutter/foundation.dart';
import 'package:package_info/package_info.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart';

import 'models/preparation_model.dart';

class RecipesDatabase {
  late Database _db;
  init() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "bettycook.db");

    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    var appVersion = hiveDB.settingsBox.get(settingsBoxAppVersionKey);
    var dbVersion = hiveDB.settingsBox.get(settingsBoxDBVersionKey);
    if (kDebugMode || appVersion == null || appVersion != packageInfo.version) {
      await _createDB(path);
      await _openDB();
      int tempDBVersion = await _db.getVersion();

      if (kDebugMode || dbVersion == null || dbVersion != tempDBVersion)
        await _initHiveDB();

      await closeDB();
      await File(path).delete();

      hiveDB.settingsBox.put(settingsBoxAppVersionKey, packageInfo.version);
      hiveDB.settingsBox.put(settingsBoxDBVersionKey, tempDBVersion);
    }
  }

  Future<void> _createDB(path) async {
    // Should happen only the first time you launch your application
    // Make sure the parent directory exists
    try {
      await Directory(dirname(path)).create(recursive: true);
    } catch (_) {}

    // Copy from asset
    ByteData data = await rootBundle.load(join("assets", "database.db"));
    List<int> bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

    // Write and flush the bytes written
    await File(path).writeAsBytes(bytes, flush: true);
  }

  Future<void> _initHiveDB() async {
    await _initTipsHive();
    await _initCategoriesHive();
  }

  // init Hive Database boxes
  Future<void> _initTipsHive() async {
    for (TipModel tip in (await getTips())) {
      TipHive tipHive = TipHive(id: tip.id, tip: tip.tip);

      await hiveDB.tipsBox.put(tip.id, tipHive);
    }
  }

  Future<void> _initCategoriesHive() async {
    for (CategoryModel category in (await getCategories())) {
      CategoryHive categoryHive = CategoryHive(
          id: category.id, name: category.name, image: category.image);

      await _initSubCategoriesHive(category.id, categoryHive);
      await hiveDB.categoriesBox.put(category.id, categoryHive);
    }
  }

  Future<void> _initSubCategoriesHive(
      int categoryId, CategoryHive categoryHive) async {
    for (SubCategoryModel subCategory in (await getSubCategories(categoryId))) {
      SubCategoryHive subCategoryHive = SubCategoryHive(
          id: subCategory.id,
          name: subCategory.name,
          category: categoryHive,
          image: subCategory.image);

      await _initRecipesHive(categoryId, subCategory.id, subCategoryHive);
      await hiveDB.subCategoriesBox.put(subCategory.id, subCategoryHive);
    }
  }

  Future<void> _initRecipesHive(int categoryId, int subCategoryId,
      SubCategoryHive subCategoryHive) async {
    for (RecipeModel recipe in (await getRecipes(categoryId, subCategoryId))) {
      RecipeHive recipeHive = RecipeHive(
        id: recipe.id,
        title: recipe.title,
        ingredients: _initRecipeIngredientHive(recipe.ingredients),
        preparation: _initRecipePreparationHive(recipe.preparation),
        subcategory: subCategoryHive,
        image: recipe.image,
      );
      RecipeHive? recipeHiveBox = hiveDB.recipesBox.get(recipe.id);

      if (recipeHiveBox != null) {
        recipeHive.favorite = recipeHiveBox.favorite;
        recipeHive.notes.addAll(recipeHiveBox.notes);
        recipeHive.calendar.addAll(recipeHiveBox.calendar);
      }

      hiveDB.recipesBox.put(recipe.id, recipeHive);
    }
  }

  List<IngredientHive> _initRecipeIngredientHive(
      List<IngredientModel> ingredients) {
    List<IngredientHive> ingredientHive = [];
    for (IngredientModel _ingredient in ingredients) {
      List<IngredientsHive> ingredientsHive = [];
      for (IngredientsModel _ingredients in _ingredient.ingredients) {
        ingredientsHive.add(IngredientsHive(
            amount: _ingredients.amount,
            measure: _ingredients.measure,
            ingredient: _ingredients.ingredient,
            comment: _ingredients.comment));
        ingredientHive.add(IngredientHive(
            target: _ingredient.target, ingredients: ingredientsHive));
      }
    }

    return ingredientHive;
  }

  List<PreparationHive> _initRecipePreparationHive(
      List<PreparationModel> preparation) {
    List<PreparationHive> preparations = [];
    for (PreparationModel _preparation in preparation)
      preparations.add(PreparationHive(
          target: _preparation.target, preparation: _preparation.preparation));
    return preparations;
  }

  Future<void> _openDB() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "bettycook.db");

    // open the database
    _db = await openReadOnlyDatabase(path);
  }

  Future<void> closeDB() async {
    // close the database
    await _db.close();
  }

  Future<List<CategoryModel>> getCategories() async {
    List<Map<String, dynamic>> results = await _db.query("categories");
    return results.map((map) => CategoryModel.fromMap(map)).toList();
  }

  Future<List<SubCategoryModel>> getSubCategories(int categoryId) async {
    List<Map<String, dynamic>> results = await _db
        .query("subcategories", where: "category = ?", whereArgs: [categoryId]);
    return results.map((map) => SubCategoryModel.fromMap(map)).toList();
  }

  Future<List<RecipeModel>> getRecipes(
      int categoryId, int subcategoryId) async {
    List<Map<String, dynamic>> results = await _db.query(
      "recipes",
      where: "category = ? AND subcategory = ?",
      whereArgs: [categoryId, subcategoryId],
    );
    return results.map((map) => RecipeModel.fromMap(map)).toList();
  }

  Future<List<PreparationModel>> getRecipePreparation(int id) async {
    List<Map<String, dynamic>> results = await _db.query('recipes',
        where: 'id = ?', whereArgs: [id], columns: ["preparation"]);
    List preparation = jsonDecode(results[0]['preparation']);

    return preparation.map((map) => PreparationModel.fromMap(map)).toList();
  }

  Future<List<IngredientModel>> getRecipeIngredients(int id) async {
    List<Map<String, dynamic>> results = await _db.query('recipes',
        where: 'id = ?', whereArgs: [id], columns: ["ingredients"]);

    List ingredients = jsonDecode(results[0]['ingredients']);

    return ingredients.map((map) => IngredientModel.fromMap(map)).toList();
  }

  Future<List<TipModel>> getTips() async {
    List<Map<String, dynamic>> results =
        await _db.query("tips", columns: ["id", "tip"]);

    return results.map((map) => TipModel.fromMap(map)).toList();
  }

  Future<int> getTipsLength() async {
    List<Map<String, dynamic>> results =
        await _db.query('tips', columns: ["id"]);

    return results.length;
  }

  Future<TipModel> getTipRandom() async {
    Random random = Random();
    int tipLength = await getTipsLength();
    List<Map<String, dynamic>> results = [];

    do {
      results = await _db.query("tips",
          columns: ["id", "tip"],
          where: 'id = ?',
          whereArgs: [random.nextInt(tipLength)]);
    } while (results.length == 0);

    return results.map((map) => TipModel.fromMap(map)).toList()[0];
  }

  Future<TipModel> getTip(int id) async {
    List<Map<String, dynamic>> results = await _db.query("tips",
        columns: ["id", "tip"], where: 'id = ?', whereArgs: [id]);

    return results.map((map) => TipModel.fromMap(map)).toList()[0];
  }
}
