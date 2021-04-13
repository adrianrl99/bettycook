import 'dart:math';

import 'package:betsy_s_cookbook/src/constants.dart';
import 'package:betsy_s_cookbook/src/database.dart';
import 'package:betsy_s_cookbook/src/widgets/home_page/home_not_favorite_widget.dart';
import 'package:betsy_s_cookbook/src/widgets/recipe_widget.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeFavoriteWidget extends StatefulWidget {
  const HomeFavoriteWidget({Key key}) : super(key: key);

  @override
  _HomeFavoriteWidgetState createState() => _HomeFavoriteWidgetState();
}

class _HomeFavoriteWidgetState extends State<HomeFavoriteWidget> {
  RecipesDatabase db = RecipesDatabase();
  Random random = Random();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ValueListenableBuilder(
            valueListenable: Hive.box(favoritesBox).listenable(),
            builder: (context, box, widget) {
              var favorites = box.get("favorites", defaultValue: []);
              if (favorites.length > 0)
                return FutureBuilder(
                  future:
                      db.getRecipe(favorites[random.nextInt(favorites.length)]),
                  builder: (BuildContext context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done)
                      return Expanded(child: RecipeWidget(snapshot.data));
                    else
                      return Expanded(child: Container());
                  },
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
