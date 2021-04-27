import 'package:bettycook/src/config.dart';
import 'package:bettycook/src/models/models.dart';
import 'package:bettycook/src/widgets/bottom_nav_bar.dart';
import 'package:bettycook/src/widgets/drawer_widget.dart';
import 'package:bettycook/src/widgets/floating_home_widget.dart';
import 'package:bettycook/src/widgets/subcategory_widget.dart';
import 'package:flutter/material.dart';
import 'package:bettycook/src/extensions/extensions.dart';

class CategoryPage extends StatefulWidget {
  static const routeName = "/category";

  final CategoryModel category;

  const CategoryPage({required this.category, Key? key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
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
        title: Text(widget.category.name.inCaps),
      ),
      drawer: DrawerWidget(),
      body: Container(
        child: FutureBuilder(
          future: db.getSubCategories(widget.category.id),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return GridView.count(
                crossAxisCount: 2,
                padding: const EdgeInsets.all(8),
                children: [
                  for (SubCategoryModel subcategory in snapshot.data)
                    SubCategoryWidget(subcategory: subcategory),
                ],
              );
            } else {
              return Container();
            }
          },
        ),
      ),
      floatingActionButton: FloatingHomeWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavBar(
        category: widget.category,
      ),
    );
  }
}
