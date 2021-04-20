import 'package:bettycook/src/database.dart';
import 'package:bettycook/src/models/models.dart';
import 'package:bettycook/src/pages/pages.dart';
import 'package:bettycook/src/widgets/bottom_nav_bar.dart';
import 'package:bettycook/src/widgets/recipe_widget.dart';
import 'package:bettycook/src/extensions/extensions.dart';
import 'package:flutter/material.dart';

class SubCategoryPage extends StatefulWidget {
  static const routeName = "/subcategory";

  final SubCategoryModel subcategory;

  const SubCategoryPage({required this.subcategory, Key? key})
      : super(key: key);

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
              Navigator.of(context).pushNamed(SearchSubCategoryPage.routeName,
                  arguments: widget.subcategory);
            },
          ),
        ],
      ),
      body: Container(
        child: FutureBuilder(
          future:
              db.getRecipes(widget.subcategory.category, widget.subcategory.id),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView(
                children: <Widget>[
                  if (snapshot.data != null)
                    for (RecipeModel recipe in snapshot.data)
                      Container(
                        padding: const EdgeInsets.only(
                            top: 8.0, bottom: 8.0, left: 16.0, right: 16.0),
                        child: RecipeWidget(recipe: recipe),
                      )
                  else
                    Container()
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
