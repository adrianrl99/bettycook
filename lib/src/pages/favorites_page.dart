import 'package:betsy_s_cookbook/src/constants.dart';
import 'package:betsy_s_cookbook/src/database.dart';
import 'package:betsy_s_cookbook/src/models/models.dart';
import 'package:betsy_s_cookbook/src/pages/pages.dart';
import 'package:betsy_s_cookbook/src/widgets/bottom_nav_bar.dart';
import 'package:betsy_s_cookbook/src/widgets/home_page/home_not_favorite_widget.dart';
import 'package:betsy_s_cookbook/src/widgets/recipe_widget.dart';
import 'package:betsy_s_cookbook/src/extensions/extensions.dart';
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
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.of(context).pushNamed(SearchFavoritesPage.routeName);
            },
          ),
        ],
      ),
      body: Container(
        child: ValueListenableBuilder(
          valueListenable: Hive.box(favoritesBox).listenable(),
          builder: (BuildContext context, Box box, w) {
            List favorites = box.get("favorites", defaultValue: []);
            if (favorites.length > 0)
              return FutureBuilder(
                future: db.getRecipesById(favorites),
                builder: (BuildContext context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return ListView(
                      children: <Widget>[
                        for (RecipeModel recipe in snapshot.data)
                          Container(
                            padding: const EdgeInsets.only(
                                top: 8.0, bottom: 8.0, left: 16.0, right: 16.0),
                            child: RecipeWidget(recipe),
                          )
                      ],
                    );
                  } else {
                    return Container();
                  }
                },
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
