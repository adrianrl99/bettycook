import 'package:betsy_s_cookbook/src/database.dart';
import 'package:betsy_s_cookbook/src/models/models.dart';
import 'package:betsy_s_cookbook/src/pages/pages.dart';
import 'package:betsy_s_cookbook/src/widgets/bottom_nav_bar.dart';
import 'package:betsy_s_cookbook/src/widgets/subcategory_widget.dart';
import 'package:flutter/material.dart';
import 'package:betsy_s_cookbook/src/extensions/extensions.dart';

class CategoryPage extends StatefulWidget {
  static const routeName = "/category";

  final CategoryModel category;

  const CategoryPage({this.category, Key key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  RecipesDatabase db = RecipesDatabase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.name.inCaps),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.of(context).pushNamed(SearchCategoryPage.routeName);
            },
          ),
        ],
      ),
      body: Container(
        child: FutureBuilder(
          future: db.getSubCategories(widget.category.id),
          builder: (BuildContext context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return GridView.count(
                crossAxisCount: 2,
                padding: EdgeInsets.all(8),
                children: [
                  for (SubCategoryModel subcategory in snapshot.data)
                    SubCategoryWidget(subcategory),
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