import 'dart:io';

import 'package:badges/badges.dart';
import 'package:bettycook/src/config.dart';
import 'package:bettycook/src/widgets/bottom_nav_bar.dart';
import 'package:bettycook/src/widgets/fullscreen_photo_widget.dart';
import 'package:bettycook/src/widgets/recipe_page/calendar_tab_widget.dart';
import 'package:bettycook/src/widgets/recipe_page/ingredients_tab_widget.dart';
import 'package:bettycook/src/widgets/recipe_page/notes_widget.dart';
import 'package:bettycook/src/widgets/recipe_page/preparation_tab_widget.dart';
import 'package:bettycook/src/widgets/recipe_page/title_widget.dart';
import 'package:bettycookplugins/bettycookplugins.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:hive/hive.dart';

class RecipePage extends StatefulWidget {
  static const routeName = "/recipe";

  final RecipeHive recipe;

  const RecipePage({
    required this.recipe,
    Key? key,
  }) : super(key: key);

  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  ScrollController controller = ScrollController();

  void showNotesDialog(BuildContext context) async {
    await showDialog(
        context: context,
        useSafeArea: true,
        useRootNavigator: true,
        builder: (BuildContext context) {
          return NotesWidget(
            recipe: this.widget.recipe,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          controller: controller,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                actions: <Widget>[
                  IconButton(
                    color: Colors.white,
                    icon: Icon(Icons.fullscreen),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return FullScreenPhotoWidget(
                                image: FileImage(File(
                              join(
                                  hiveDB.settingsBoxBase
                                      .get(settingsBoxAppDirKey),
                                  "recipes",
                                  this.widget.recipe.title),
                            )));
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
                        image: FileImage(File(
                          join(hiveDB.settingsBoxBase.get(settingsBoxAppDirKey),
                              "recipes", this.widget.recipe.title),
                        )),
                        fit: BoxFit.cover),
                  ),
                  child: Container(
                    height: double.infinity,
                    color: Colors.black.withOpacity(.5),
                    child: Container(
                      alignment: Alignment.center,
                      child: TitleWidget(
                        controller: controller,
                        title: this.widget.recipe.title,
                      ),
                    ),
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
                  ingredients: this.widget.recipe.ingredients,
                  title: this.widget.recipe.title),
              PreparationTabWidget(
                  preparation: this.widget.recipe.preparation,
                  title: this.widget.recipe.title),
              CalendarTabWidget(recipe: this.widget.recipe),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        recipe: this.widget.recipe,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ValueListenableBuilder(
        valueListenable: hiveDB.recipesBoxBaseListable(),
        builder:
            (BuildContext context, Box<RecipeHive> recipexBox, Widget? child) {
          return Badge(
            position: BadgePosition.bottomStart(),
            showBadge: this.widget.recipe.notes.isNotEmpty,
            badgeContent: Text(this.widget.recipe.notes.length.toString()),
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
