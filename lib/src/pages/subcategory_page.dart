import 'package:bettycook/src/adapters/adapters.dart';
import 'package:bettycook/src/config.dart';
import 'package:bettycook/src/widgets/bottom_nav_bar.dart';
import 'package:bettycook/src/widgets/drawer_widget.dart';
import 'package:bettycook/src/widgets/floating_home_widget.dart';
import 'package:bettycook/src/widgets/recipe_widget.dart';
import 'package:bettycook/src/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class SubCategoryPage extends StatefulWidget {
  static const routeName = "/subcategory";

  final SubCategoryHive subcategory;

  const SubCategoryPage({required this.subcategory, Key? key})
      : super(key: key);

  @override
  _SubCategoryPageState createState() => _SubCategoryPageState();
}

class _SubCategoryPageState extends State<SubCategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        title: Text(this.widget.subcategory.name.inCaps),
      ),
      drawer: DrawerWidget(),
      body: Container(
        child: ValueListenableBuilder(
          valueListenable: hiveDB.recipesBoxListable(),
          builder:
              (BuildContext context, Box<RecipeHive> recipeBox, Widget? child) {
            Iterable<RecipeHive> recipes = recipeBox.values.where(
                (element) => element.subcategory.id == widget.subcategory.id);
            return ListView(
              children: <Widget>[
                for (RecipeHive recipe in recipes)
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: RecipeWidget(recipe: recipe),
                  )
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingHomeWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavBar(subcategory: widget.subcategory),
    );
  }
}
