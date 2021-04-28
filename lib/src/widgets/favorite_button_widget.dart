import 'package:bettycook/src/adapters/adapters.dart';
import 'package:bettycook/src/constants.dart';
import 'package:bettycook/src/hive_functions.dart';
import 'package:bettycook/src/models/models.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FavoriteButtonWidget extends StatelessWidget {
  final RecipeHive recipe;
  const FavoriteButtonWidget({required this.recipe, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box(favoritesBoxKey).listenable(),
      builder: (BuildContext context, Box box, _) {
        return IconButton(
          icon: Icon(
            box.containsKey(this.recipe.key)
                ? Icons.favorite
                : Icons.favorite_border,
            color: box.containsKey(this.recipe.key)
                ? Colors.red[800]
                : Colors.white,
          ),
          onPressed: () =>
              toggleFavorite(box, this.recipe.key, this.recipe.title),
        );
      },
    );
  }
}
