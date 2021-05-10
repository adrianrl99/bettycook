import 'package:bettycook/src/pages/pages.dart';
import 'package:bettycook/src/widgets/calendar_button_widget.dart';
import 'package:bettycook/src/widgets/favorite_button_widget.dart';
import 'package:bettycook/src/widgets/rating_button_recipe_widget.dart';
import 'package:bettycook/src/widgets/share_button_widget.dart';
import 'package:bettycookplugins/bettycookplugins.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final CategoryHive? category;
  final SubCategoryHive? subcategory;
  final RecipeHive? recipe;
  BottomNavBar({Key? key, this.subcategory, this.category, this.recipe})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? route = ModalRoute.of(context)!.settings.name;

    return BottomAppBar(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: CircularNotchedRectangle(),
      notchMargin: 4.0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        color: Theme.of(context).primaryColor,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                if (route == RecipePage.routeName)
                  Row(
                    children: [
                      ShareButtonWidget(recipe: this.recipe!),
                      RatingButtonRecipeWidget(recipe: this.recipe!),
                    ],
                  ),
                if (route != RecipePage.routeName)
                  IconButton(
                    icon: Icon(Icons.menu),
                    color: Colors.white,
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ),
              ],
            ),
            Row(
              children: <Widget>[
                if (route == RecipePage.routeName)
                  Row(
                    children: <Widget>[
                      CalendarButtonWidget(recipe: this.recipe!),
                      FavoriteButtonWidget(recipe: this.recipe!),
                    ],
                  )
                else
                  IconButton(
                    icon: Icon(Icons.search),
                    color: Colors.white,
                    onPressed: () {
                      switch (route) {
                        case HomePage.routeName:
                          Navigator.of(context)
                              .pushNamed(SearchAllPage.routeName);
                          break;
                        case CategoryPage.routeName:
                          Navigator.of(context).pushNamed(
                              SearchCategoryPage.routeName,
                              arguments: this.category);
                          break;
                        case SubCategoryPage.routeName:
                          Navigator.of(context).pushNamed(
                              SearchSubCategoryPage.routeName,
                              arguments: this.subcategory);
                          break;
                      }
                    },
                  )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
