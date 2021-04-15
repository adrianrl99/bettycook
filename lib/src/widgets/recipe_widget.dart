import 'package:bettycook/src/constants.dart';
import 'package:bettycook/src/functions.dart';
import 'package:bettycook/src/models/models.dart';
import 'package:bettycook/src/pages/pages.dart';
import 'package:bettycook/src/extensions/extensions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
                trailing: ValueListenableBuilder(
                  valueListenable: Hive.box(favoritesBox).listenable(),
                  builder: (BuildContext context, Box box, _) {
                    return IconButton(
                      icon: Icon(
                        box.containsKey(this.recipe.id)
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Colors.red[800],
                      ),
                      onPressed: () => toggleFavorite(
                          box, this.recipe.id, this.recipe.title),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
