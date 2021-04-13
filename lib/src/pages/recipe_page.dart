import 'package:betsy_s_cookbook/src/constants.dart';
import 'package:betsy_s_cookbook/src/database.dart';
import 'package:betsy_s_cookbook/src/functions.dart';
import 'package:betsy_s_cookbook/src/models/models.dart';
import 'package:betsy_s_cookbook/src/widgets/bottom_nav_bar.dart';
import 'package:betsy_s_cookbook/src/extensions/extensions.dart';
import 'package:betsy_s_cookbook/src/widgets/recipe_page/details_tab_widget.dart';
import 'package:betsy_s_cookbook/src/widgets/recipe_page/ingredients_tab_widget.dart';
import 'package:betsy_s_cookbook/src/widgets/recipe_page/preparation_tab_widget.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class RecipePage extends StatefulWidget {
  static const routeName = "/recipe";

  final RecipeModel recipe;

  const RecipePage({this.recipe, Key key}) : super(key: key);

  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  RecipesDatabase db = RecipesDatabase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder:
              (BuildContext context, bool innerBoxIsScrolled) => <Widget>[
            SliverAppBar(
              actions: <Widget>[
                ValueListenableBuilder(
                  valueListenable: Hive.box(favoritesBox).listenable(),
                  builder: (BuildContext context, Box box, w) {
                    List favorites = box.get("favorites", defaultValue: []);
                    return IconButton(
                      icon: Icon(
                        favorites.contains(widget.recipe.id)
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Colors.red[800],
                      ),
                      onPressed: () =>
                          toggleFavorite(favorites, box, widget.recipe.id),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.share,
                  ),
                  onPressed: () {},
                )
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
                    child: Text("Detalles"),
                  ),
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
              DetailsTabWidget(widget.recipe.id),
              IngredientsTabWidget(),
              PreparationTabWidget(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
