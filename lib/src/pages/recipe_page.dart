import 'package:badges/badges.dart';
import 'package:bettycook/src/adapters/adapters.dart';
import 'package:bettycook/src/constants.dart';
import 'package:bettycook/src/models/models.dart';
import 'package:bettycook/src/widgets/bottom_nav_bar.dart';
import 'package:bettycook/src/extensions/extensions.dart';
import 'package:bettycook/src/widgets/fullscreen_photo_widget.dart';
import 'package:bettycook/src/widgets/recipe_page/calendar_tab_widget.dart';
import 'package:bettycook/src/widgets/recipe_page/ingredients_tab_widget.dart';
import 'package:bettycook/src/widgets/recipe_page/notes_widget.dart';
import 'package:bettycook/src/widgets/recipe_page/preparation_tab_widget.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class RecipePage extends StatelessWidget {
  static const routeName = "/recipe";

  final RecipeHive recipe;

  const RecipePage({required this.recipe, Key? key}) : super(key: key);

  void showNotesDialog(BuildContext context) async {
    await showDialog(
        context: context,
        useSafeArea: true,
        useRootNavigator: true,
        builder: (BuildContext context) {
          return NotesWidget(
            recipe: this.recipe,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                title: Text(this.recipe.title.inCaps),
                actions: <Widget>[
                  IconButton(
                    color: Colors.white,
                    icon: Icon(Icons.fullscreen),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return FullScreenPhotoWidget(
                                imagePath:
                                    "assets/images/recipes/${this.recipe.title.format}.png");
                          });
                    },
                  ),
                ],
                centerTitle: true,
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
                snap: true,
                floating: true,
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
            ];
          },
          body: TabBarView(
            children: <Widget>[
              IngredientsTabWidget(ingredients: this.recipe.ingredients),
              PreparationTabWidget(id: this.recipe.key),
              CalendarTabWidget(recipe: this.recipe),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        recipe: this.recipe,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ValueListenableBuilder(
        valueListenable: Hive.box(notesBoxKey).listenable(),
        builder: (BuildContext context, Box box, _) {
          return Badge(
              position: BadgePosition.bottomStart(),
              showBadge: box.isNotEmpty,
              badgeContent: Text(
                (box.length).toString(),
              ),
              child: FloatingActionButton(
                child: Icon(Icons.notes),
                onPressed: () {
                  showNotesDialog(context);
                },
              ));
        },
      ),
    );
  }
}
