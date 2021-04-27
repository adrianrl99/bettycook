import 'dart:math';

import 'package:bettycook/src/constants.dart';
import 'package:bettycook/src/models/models.dart';
import 'package:bettycook/src/widgets/home_page/home_not_favorite_widget.dart';
import 'package:bettycook/src/widgets/recipe_widget.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeFavoriteWidget extends StatefulWidget {
  const HomeFavoriteWidget({Key? key}) : super(key: key);

  @override
  _HomeFavoriteWidgetState createState() => _HomeFavoriteWidgetState();
}

class _HomeFavoriteWidgetState extends State<HomeFavoriteWidget> {
  Random random = Random();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ValueListenableBuilder(
            valueListenable: Hive.box(favoritesBoxKey).listenable(),
            builder: (context, Box box, _) {
              if (box.isNotEmpty) {
                List favorite = box.getAt(random.nextInt(box.length));
                return Expanded(
                  child: RecipeWidget(
                    recipe: RecipeModel.basic(favorite[0], favorite[1]),
                  ),
                );
              } else
                return Expanded(child: HomeNotFavoriteWidget());
            },
          ),
        ],
      ),
    );
  }
}
