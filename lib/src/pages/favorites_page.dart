import 'package:bettycook/src/constants.dart';
import 'package:bettycook/src/database.dart';
import 'package:bettycook/src/models/models.dart';
import 'package:bettycook/src/widgets/bottom_nav_bar.dart';
import 'package:bettycook/src/widgets/home_page/home_not_favorite_widget.dart';
import 'package:bettycook/src/widgets/recipe_widget.dart';
import 'package:bettycook/src/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FavoritesPage extends StatefulWidget {
  static const routeName = "/favorites";
  final String title = "Favoritos";

  const FavoritesPage({Key key}) : super(key: key);

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  RecipesDatabase db = RecipesDatabase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title.inCaps),
      ),
      body: Container(
        child: ValueListenableBuilder(
          valueListenable: Hive.box(favoritesBox).listenable(),
          builder: (BuildContext context, Box box, _) {
            if (box.isNotEmpty)
              return ListView(
                children: <Widget>[
                  for (List recipe in box.values)
                    Container(
                      padding: const EdgeInsets.only(
                          top: 8.0, bottom: 8.0, left: 16.0, right: 16.0),
                      child:
                          RecipeWidget(RecipeModel.basic(recipe[0], recipe[1])),
                    )
                ],
              );
            else
              return HomeNotFavoriteWidget();
          },
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
