import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:bettycook/src/adapters/adapters.dart';
import 'package:bettycook/src/config.dart';
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
  late Database _dbTemp;
  init() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "bettycook.db");
    var tempPath = join(databasesPath, "bettycook_temp.db");

    // Check if the database exists
    var exists = await databaseExists(path);

    if (!exists || kDebugMode) {
      await _initDB(path);
    } else {
      await _createDB(tempPath);
      await _openDB(false);
      await _openDB(true);
      if (!(await _checkDBVersion())) {
        await closeDB();
        await File(path).delete();
        await _initDB(path);
      }
    }
  }

  Future<void> _initDB(path) async {
    await _createDB(path);
    await _openDB(false);
    await _initHiveDB();
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
    for (TipModel tip in (await getTips()))
      await hiveDB.tipsBox.put(tip.id, TipHive(tip: tip.tip));
  }

  Future<void> _initCategoriesHive() async {
    for (CategoryModel category in (await getCategories())) {
      CategoryHive categoryHive = CategoryHive(name: category.name);
      await _initSubCategoriesHive(category.id, categoryHive);
      await hiveDB.categoriesBox.put(category.id, categoryHive);
    }
  }

  Future<void> _initSubCategoriesHive(
      int categoryId, CategoryHive categoryHive) async {
    for (SubCategoryModel subCategory in (await getSubCategories(categoryId))) {
      SubCategoryHive subCategoryHive =
          SubCategoryHive(name: subCategory.name, category: categoryHive);
      await _initRecipesHive(categoryId, subCategory.id, subCategoryHive);
      await hiveDB.subCategoriesBox.put(subCategory.id, subCategoryHive);
    }
  }

  Future<void> _initRecipesHive(int categoryId, int subCategoryId,
      SubCategoryHive subCategoryHive) async {
    for (RecipeModel recipe in (await getRecipes(categoryId, subCategoryId))) {
      hiveDB.recipesBox.put(
          recipe.id,
          RecipeHive(
              title: recipe.title,
              ingredients: _initRecipeIngredientHive(recipe.ingredients),
              preparation: _initRecipePreparationHive(recipe.preparation),
              subcategory: subCategoryHive));
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

  Future<bool> _checkDBVersion() async {
    bool checkVersion = await _db.getVersion() == await _dbTemp.getVersion();
    return checkVersion;
  }

  Future<void> _openDB(bool isTemp) async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "bettycook.db");
    var tempPath = join(databasesPath, "bettycook_temp.db");

    // open the database
    if (!isTemp)
      _db = await openReadOnlyDatabase(path);
    else
      _db = await openReadOnlyDatabase(tempPath);
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

  Future<List<RecipeModel>> getRecipesBasic(
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
