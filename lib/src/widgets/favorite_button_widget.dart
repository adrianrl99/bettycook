import 'package:bettycook/src/constants.dart';
import 'package:bettycook/src/hive_functions.dart';
import 'package:bettycook/src/models/models.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FavoriteButtonWidget extends StatelessWidget {
  final RecipeModel recipe;
  const FavoriteButtonWidget({required this.recipe, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box(favoritesBox).listenable(),
      builder: (BuildContext context, Box box, _) {
        return IconButton(
          icon: Icon(
            box.containsKey(this.recipe.id)
                ? Icons.favorite
                : Icons.favorite_border,
            color: Colors.red[800],
          ),
          onPressed: () =>
              toggleFavorite(box, this.recipe.id, this.recipe.title),
        );
      },
    );
  }
}
