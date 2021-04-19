import 'package:bettycook/src/constants.dart';
import 'package:bettycook/src/database.dart';
import 'package:bettycook/src/functions.dart';
import 'package:bettycook/src/models/models.dart';
import 'package:bettycook/src/widgets/bottom_nav_bar.dart';
import 'package:bettycook/src/extensions/extensions.dart';
import 'package:bettycook/src/widgets/recipe_page/ingredients_tab_widget.dart';
import 'package:bettycook/src/widgets/recipe_page/preparation_tab_widget.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class RecipePage extends StatefulWidget {
  static const routeName = "/recipe";

  final RecipeModel recipe;

  const RecipePage({required this.recipe}) : super();

  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  RecipesDatabase db = RecipesDatabase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder:
              (BuildContext context, bool innerBoxIsScrolled) => <Widget>[
            SliverAppBar(
              actions: <Widget>[
                ValueListenableBuilder(
                  valueListenable: Hive.box(favoritesBox).listenable(),
                  builder: (BuildContext context, Box box, w) {
                    return IconButton(
                      icon: Icon(
                        box.containsKey(widget.recipe.id)
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Colors.red[800],
                      ),
                      onPressed: () => toggleFavorite(
                          box, widget.recipe.id, widget.recipe.title),
                    );
                  },
                ),
              ],
              title: Text(widget.recipe.title.inCaps),
              expandedHeight: 320,
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        "assets/images/recipes/${widget.recipe.title.format}.png",
                      ),
                      fit: BoxFit.cover),
                ),
                child: Container(
                  color: Colors.black.withOpacity(.5),
                ),
              ),
              pinned: true,
              bottom: TabBar(
                indicatorWeight: 4,
                labelColor: Colors.white,
                tabs: <Tab>[
                  Tab(
                    child: Text("Ingredientes"),
                  ),
                  Tab(
                    child: Text("Preparacion"),
                  )
                ],
              ),
            )
          ],
          body: TabBarView(
            children: <Widget>[
              IngredientsTabWidget(id: widget.recipe.id),
              PreparationTabWidget(id: widget.recipe.id),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
