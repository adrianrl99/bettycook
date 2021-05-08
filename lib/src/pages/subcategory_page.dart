import 'package:bettycook/src/config.dart';
import 'package:bettycook/src/widgets/bottom_nav_bar.dart';
import 'package:bettycook/src/widgets/drawer_widget.dart';
import 'package:bettycook/src/widgets/floating_home_widget.dart';
import 'package:bettycook/src/widgets/recipe_widget.dart';
import 'package:bettycook/src/extensions/extensions.dart';
import 'package:bettycookplugins/bettycookplugins.dart';
import 'package:flutter/material.dart';

class SubCategoryPage extends StatelessWidget {
  static const routeName = "/subcategory";

  final SubCategoryHive subCategory;

  const SubCategoryPage({
    required this.subCategory,
    Key? key,
  }) : super(key: key);

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
        title: Text(this.subCategory.name.inCaps),
      ),
      drawer: DrawerWidget(),
      body: ListView(
        children: <Widget>[
          for (RecipeHive recipe in hiveDB.recipesBoxBase.values
              .where((element) => element.subCategory == this.subCategory.key))
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: RecipeWidget(
                recipe: recipe,
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingHomeWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavBar(subcategory: this.subCategory),
    );
  }
}
