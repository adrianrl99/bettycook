import 'package:bettycook/src/config.dart';
import 'package:bettycookplugins/bettycookplugins.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hive/hive.dart';

class RatingButtonRecipeWidget extends StatelessWidget {
  final RecipeHive recipe;
  const RatingButtonRecipeWidget({required this.recipe, Key? key})
      : super(key: key);

  void showRating(BuildContext context) {
    showAboutDialog(
      children: <Widget>[
        RatingBar.builder(
          initialRating: 3,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            print(rating);
          },
        ),
      ],
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: hiveDB.recipesBoxBaseListable(),
      builder: (BuildContext context, Box<RecipeHive> value, Widget? child) {
        return Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.star,
                color: recipe.rating > 0 ? Colors.yellow : Colors.white,
              ),
              onPressed: () => showRating(context),
            ),
            if (recipe.rating > 0) Text(recipe.rating.toString()),
          ],
        );
      },
    );
  }
}
