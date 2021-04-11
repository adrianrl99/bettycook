import 'package:betsy_s_cookbook/src/widgets/bottom_nav_bar.dart';
import 'package:betsy_s_cookbook/src/widgets/recipe_widget.dart';
import 'package:flutter/material.dart';

class SubCategoryPage extends StatelessWidget {
  static const routeName = "/subcategory";
  static const onPressedSearch = "/search$routeName";
  final String title = "SubCategoria";

  const SubCategoryPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.of(context).pushNamed(onPressedSearch);
            },
          ),
        ],
      ),
      body: Center(
        child: Container(
          child: ListView(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(
                    top: 8.0, bottom: 8.0, left: 16.0, right: 16.0),
                child: RecipeWidget("/recipe"),
              ),
              Container(
                padding: const EdgeInsets.only(
                    top: 8.0, bottom: 8.0, left: 16.0, right: 16.0),
                child: RecipeWidget("/recipe"),
              ),
              Container(
                padding: const EdgeInsets.only(
                    top: 8.0, bottom: 8.0, left: 16.0, right: 16.0),
                child: RecipeWidget("/recipe"),
              ),
              Container(
                padding: const EdgeInsets.only(
                    top: 8.0, bottom: 8.0, left: 16.0, right: 16.0),
                child: RecipeWidget("/recipe"),
              ),
              Container(
                padding: const EdgeInsets.only(
                    top: 8.0, bottom: 8.0, left: 16.0, right: 16.0),
                child: RecipeWidget("/recipe"),
              ),
              Container(
                padding: const EdgeInsets.only(
                    top: 8.0, bottom: 8.0, left: 16.0, right: 16.0),
                child: RecipeWidget("/recipe"),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
