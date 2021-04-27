import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:bettycook/src/constants.dart';
import 'package:bettycook/src/models/ingredient_model.dart';
import 'package:bettycook/src/models/models.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart';

import 'models/preparation_model.dart';

class RecipesDatabase {
  late Database _db;
  initDB() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "bettycook.db");

    // Check if the database exists
    var exists = await databaseExists(path);

    if (!exists || !(await _checkDBVersion()) || kDebugMode) {
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
  }

  Future<bool> _checkDBVersion() async {
    await openDB();
    bool checkVersion = await _db.getVersion() == db_version;
    await closeDB();
    return checkVersion;
  }

  Future<void> openDB() async {
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
    List<Map<String, dynamic>> results = await _db.query("recipes",
        where: "category = ? AND subcategory = ?",
        whereArgs: [categoryId, subcategoryId],
        columns: ["id", "title"]);
    return results.map((map) => RecipeModel.fromMapBasic(map)).toList();
  }

  Future<RecipeModel> getRecipe(int id) async {
    List<Map<String, dynamic>> results = await _db.query('recipes',
        where: 'id = ?', whereArgs: [id], columns: ["id", "title"]);
    return results.map((map) => RecipeModel.fromMapBasic(map)).toList()[0];
  }

  Future<List<RecipeModel>> getRecipeByTitle(String title) async {
    List<Map<String, dynamic>> results = await _db.query('recipes',
        where: "title LIKE ?",
        whereArgs: ["%$title%"],
        columns: ["id", "title"]);

    return results.map((map) => RecipeModel.fromMapBasic(map)).toList();
  }

  Future<List<RecipeModel>> getRecipeByTitleAndCategory(
      String title, int category, int subcategory) async {
    List<Map<String, dynamic>> results = await _db.query('recipes',
        where: "title LIKE ? AND category = ? AND subcategory = ?",
        whereArgs: ["%$title%", category, subcategory],
        columns: ["id", "title"]);

    return results.map((map) => RecipeModel.fromMapBasic(map)).toList();
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

  Future<List<RecipeModel>> getRecipesById(List ids) async {
    List<RecipeModel> recipes = await Future.wait(ids.map((id) async {
      List<Map<String, dynamic>> results = await _db.query("recipes",
          where: 'id = ?', whereArgs: [id], columns: ["id", "title"]);
      return results.map((map) => RecipeModel.fromMapBasic(map)).toList()[0];
    }));

    return recipes;
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
