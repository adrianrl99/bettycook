import 'dart:io';

import 'package:betsy_s_cookbook/src/models/models.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart';

class RecipesDatabase {
  Database _db;
  initDB() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "betsy_s_cookbook.db");

    // Check if the database exists
    var exists = await databaseExists(path);

    if (!exists || kDebugMode) {
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

  _openDB() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "betsy_s_cookbook.db");

    // open the database
    _db = await openReadOnlyDatabase(path);
  }

  _closeDB() async {
    // close the database
    await _db.close();
  }

  Future<List<CategoryModel>> getCategories() async {
    await _openDB();
    List<Map<String, dynamic>> results = await _db.query("categories");
    await _closeDB();
    return results.map((map) => CategoryModel.fromMap(map)).toList();
  }

  Future<List<SubCategoryModel>> getSubCategories(int categoryId) async {
    await _openDB();
    List<Map<String, dynamic>> results = await _db
        .query("subcategories", where: "category = ?", whereArgs: [categoryId]);
    await _closeDB();
    return results.map((map) => SubCategoryModel.fromMap(map)).toList();
  }

  Future<List<RecipeModel>> getRecipes(
      int categoryId, int subcategoryId) async {
    await _openDB();
    List<Map<String, dynamic>> results = await _db.query("recipes",
        where: "category = ? AND subcategory = ?",
        whereArgs: [categoryId, subcategoryId],
        columns: ["id", "title"]);
    await _closeDB();
    return results.map((map) => RecipeModel.fromMapBasic(map)).toList();
  }

  Future<RecipeModel> getRecipe(int id) async {
    await _openDB();
    List<Map<String, dynamic>> results = await _db.query('recipes',
        where: 'id = ?', whereArgs: [id], columns: ["id", "title"]);

    await _closeDB();
    return results.map((map) => RecipeModel.fromMapBasic(map)).toList()[0];
  }

  Future<String> getRecipeDetails(int id) async {
    await _openDB();
    List<Map<String, dynamic>> results = await _db.query('recipes',
        where: 'id = ?', whereArgs: [id], columns: ["details"]);
    await _closeDB();
    return results[0]['details'];
  }

  Future<List<RecipeModel>> getRecipesById(List ids) async {
    await _openDB();
    List<RecipeModel> recipes = [];
    recipes.addAll(await Future.wait(ids.map((id) async {
      List<Map<String, dynamic>> results = await _db.query("recipes",
          where: 'id = ?', whereArgs: [id], columns: ["id", "title"]);
      return results.map((map) => RecipeModel.fromMapBasic(map)).toList()[0];
    })));
    await _closeDB();
    return recipes;
  }
}
