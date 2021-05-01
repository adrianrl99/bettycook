import 'package:bettycook/src/adapters/adapters.dart';
import 'package:bettycook/src/config.dart';
import 'package:bettycook/src/widgets/home_page/home_not_favorite_widget.dart';
import 'package:bettycook/src/widgets/recipe_widget.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class FavoritesPage extends StatelessWidget {
  static const routeName = "/favorites";
  static const String title = "Favoritos";

  const FavoritesPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(FavoritesPage.title),
      ),
      body: Container(
        child: ValueListenableBuilder(
          valueListenable: hiveDB.recipesBoxListable(),
          builder: (BuildContext context, Box<RecipeHive> recipesBox,
              Widget? child) {
            List<RecipeHive> favorites = recipesBox.values
                .where((recipe) => recipe.favorite == true)
                .toList();
            if (favorites.isNotEmpty)
              return ListView(
                children: <Widget>[
                  for (RecipeHive favorite in favorites)
                    Container(
                      padding: const EdgeInsets.only(
                          top: 8.0, bottom: 8.0, left: 16.0, right: 16.0),
                      child: RecipeWidget(recipe: favorite),
                    ),
                ],
              );
            else
              return HomeNotFavoriteWidget();
          },
        ),
      ),
    );
  }
}
