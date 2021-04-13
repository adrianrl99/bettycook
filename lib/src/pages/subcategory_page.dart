import 'package:betsy_s_cookbook/src/database.dart';
import 'package:betsy_s_cookbook/src/models/models.dart';
import 'package:betsy_s_cookbook/src/pages/pages.dart';
import 'package:betsy_s_cookbook/src/widgets/bottom_nav_bar.dart';
import 'package:betsy_s_cookbook/src/widgets/recipe_widget.dart';
import 'package:betsy_s_cookbook/src/extensions/extensions.dart';
import 'package:flutter/material.dart';

class SubCategoryPage extends StatefulWidget {
  static const routeName = "/subcategory";

  final SubCategoryModel subcategory;

  const SubCategoryPage({this.subcategory, Key key}) : super(key: key);

  @override
  _SubCategoryPageState createState() => _SubCategoryPageState();
}

class _SubCategoryPageState extends State<SubCategoryPage> {
  RecipesDatabase db = RecipesDatabase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.widget.subcategory.name.inCaps),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.of(context).pushNamed(SearchSubCategoryPage.routeName);
            },
          ),
        ],
      ),
      body: Container(
        child: FutureBuilder(
          future:
              db.getRecipes(widget.subcategory.category, widget.subcategory.id),
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
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
