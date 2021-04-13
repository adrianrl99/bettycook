import 'package:betsy_s_cookbook/src/models/models.dart';
import 'package:betsy_s_cookbook/src/pages/pages.dart';
import 'package:betsy_s_cookbook/src/extensions/extensions.dart';
import 'package:flutter/material.dart';

class RecipeWidget extends StatelessWidget {
  final RecipeModel recipe;
  const RecipeWidget(this.recipe, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushNamed(RecipePage.routeName, arguments: recipe);
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 4,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/recipes/${this.recipe.title.format}.png",
                ),
                fit: BoxFit.cover,
              ),
            ),
            alignment: Alignment.bottomLeft,
            child: Container(
              color: Colors.black.withOpacity(0.35),
              child: ListTile(
                title: Text(
                  this.recipe.title.inCaps,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                trailing: Icon(
                  Icons.favorite_border,
                  color: Colors.red[800],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}