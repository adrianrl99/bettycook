import 'package:bettycook/src/config.dart';
import 'package:bettycook/src/widgets/bottom_nav_bar.dart';
import 'package:bettycook/src/widgets/drawer_widget.dart';
import 'package:bettycook/src/widgets/floating_home_widget.dart';
import 'package:bettycook/src/widgets/subcategory_widget.dart';
import 'package:bettycookplugins/bettycookplugins.dart';
import 'package:flutter/material.dart';
import 'package:bettycook/src/extensions/extensions.dart';

class CategoryPage extends StatelessWidget {
  static const routeName = "/category";

  final CategoryHive category;

  const CategoryPage({
    required this.category,
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
        title: Text(this.category.name.inCaps),
      ),
      drawer: DrawerWidget(),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(8.0),
        children: <Widget>[
          for (SubCategoryHive subCategory in hiveDB.subCategoriesBoxBase.values
              .where((element) => element.category == this.category.key))
            SubCategoryWidget(subcategory: subCategory)
        ],
      ),
      floatingActionButton: FloatingHomeWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavBar(
        category: this.category,
      ),
    );
  }
}
