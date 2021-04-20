import 'package:bettycook/src/models/models.dart';
import 'package:bettycook/src/widgets/bottom_nav_bar.dart';
import 'package:bettycook/src/extensions/extensions.dart';
import 'package:bettycook/src/widgets/calendar_button_widget.dart';
import 'package:bettycook/src/widgets/recipe_page/calendar_tab_widget.dart';
import 'package:bettycook/src/widgets/recipe_page/ingredients_tab_widget.dart';
import 'package:bettycook/src/widgets/recipe_page/notes_widget.dart';
import 'package:bettycook/src/widgets/recipe_page/preparation_tab_widget.dart';
import 'package:bettycook/src/widgets/favorite_button_widget.dart';
import 'package:flutter/material.dart';

class RecipePage extends StatelessWidget {
  static const routeName = "/recipe";

  final RecipeModel recipe;

  const RecipePage({required this.recipe, Key? key}) : super(key: key);

  void showNotesDialog(BuildContext context) async {
    await showDialog(
        context: context,
        useSafeArea: true,
        useRootNavigator: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Notas de ${this.recipe.title}"),
            content: NotesWidget(
              id: this.recipe.id,
            ),
            actions: <Widget>[
              TextButton(
                  child: Text("SALIR"),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ],
          );
        });
  }

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
                CalendarButtonWidget(recipe: this.recipe),
                FavoriteButtonWidget(recipe: this.recipe),
              ],
              title: Text(this.recipe.title.inCaps),
              expandedHeight: 320,
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        "assets/images/recipes/${this.recipe.title.format}.png",
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
                  ),
                  Tab(
                    child: Text("Calendario"),
                  ),
                ],
              ),
            )
          ],
          body: TabBarView(
            children: <Widget>[
              IngredientsTabWidget(id: this.recipe.id),
              PreparationTabWidget(id: this.recipe.id),
              CalendarTabWidget(recipe: this.recipe),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.notes),
        onPressed: () {
          showNotesDialog(context);
        },
      ),
    );
  }
}
