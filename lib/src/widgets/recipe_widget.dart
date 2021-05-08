import 'package:bettycook/src/pages/pages.dart';
import 'package:bettycook/src/extensions/extensions.dart';
import 'package:bettycook/src/widgets/calendar_button_widget.dart';
import 'package:bettycookplugins/bettycookplugins.dart';
import 'package:flutter/material.dart';
import 'package:bettycook/src/widgets/favorite_button_widget.dart';

class RecipeWidget extends StatelessWidget {
  final RecipeHive recipe;
  const RecipeWidget({required this.recipe, Key? key}) : super(key: key);

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
                image: MemoryImage(
                  decodeImage(recipe.image),
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
                trailing: Wrap(
                  children: [
                    CalendarButtonWidget(recipe: this.recipe),
                    FavoriteButtonWidget(
                      recipe: this.recipe,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
