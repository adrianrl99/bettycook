import 'dart:math';

import 'package:bettycook/src/adapters/adapters.dart';
import 'package:bettycook/src/config.dart';
import 'package:bettycook/src/widgets/home_page/home_not_favorite_widget.dart';
import 'package:bettycook/src/widgets/recipe_widget.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HomeFavoriteWidget extends StatelessWidget {
  const HomeFavoriteWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ValueListenableBuilder(
            valueListenable: hiveDB.recipesBoxListable(),
            builder: (BuildContext context, Box<RecipeHive> recipesBox,
                Widget? child) {
              Random random = Random();

              List<RecipeHive> favorites = recipesBox.values
                  .where((recipe) => recipe.favorite == true)
                  .toList();
              if (favorites.isNotEmpty)
                return Expanded(
                  child: RecipeWidget(
                      recipe: favorites[random.nextInt(favorites.length)]),
                );
              else
                return Expanded(child: HomeNotFavoriteWidget());
            },
          ),
        ],
      ),
    );
  }
}
