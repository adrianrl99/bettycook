import 'package:badges/badges.dart';
import 'package:bettycook/src/config.dart';
import 'package:bettycook/src/widgets/bottom_nav_bar.dart';
import 'package:bettycook/src/extensions/extensions.dart';
import 'package:bettycook/src/widgets/fullscreen_photo_widget.dart';
import 'package:bettycook/src/widgets/recipe_page/calendar_tab_widget.dart';
import 'package:bettycook/src/widgets/recipe_page/ingredients_tab_widget.dart';
import 'package:bettycook/src/widgets/recipe_page/notes_widget.dart';
import 'package:bettycook/src/widgets/recipe_page/preparation_tab_widget.dart';
import 'package:bettycookplugins/bettycookplugins.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class RecipePage extends StatelessWidget {
  static const routeName = "/recipe";

  final RecipeHive recipe;

  const RecipePage({
    required this.recipe,
    Key? key,
  }) : super(key: key);

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
                                image: MemoryImage(decodeImage(recipe.image)));
                          });
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {},
                  ),
                ],
                centerTitle: true,
                expandedHeight: 320,
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: MemoryImage(decodeImage(recipe.image)),
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
              IngredientsTabWidget(
                  ingredients: this.recipe.ingredients,
                  title: this.recipe.title),
              PreparationTabWidget(
                  preparation: this.recipe.preparation,
                  title: this.recipe.title),
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
        valueListenable: hiveDB.recipesBoxBaseListable(),
        builder:
            (BuildContext context, Box<RecipeHive> recipexBox, Widget? child) {
          return Badge(
            position: BadgePosition.bottomStart(),
            showBadge: this.recipe.notes.isNotEmpty,
            badgeContent: Text(this.recipe.notes.length.toString()),
            child: FloatingActionButton(
              child: Icon(Icons.notes),
              onPressed: () => showNotesDialog(context),
            ),
          );
        },
      ),
    );
  }
}
