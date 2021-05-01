import 'package:bettycook/src/adapters/adapters.dart';
import 'package:bettycook/src/config.dart';
import 'package:bettycook/src/widgets/bottom_nav_bar.dart';
import 'package:bettycook/src/widgets/drawer_widget.dart';
import 'package:bettycook/src/widgets/floating_home_widget.dart';
import 'package:bettycook/src/widgets/subcategory_widget.dart';
import 'package:flutter/material.dart';
import 'package:bettycook/src/extensions/extensions.dart';
import 'package:hive/hive.dart';

class CategoryPage extends StatelessWidget {
  static const routeName = "/category";

  final CategoryHive category;

  const CategoryPage({required this.category, Key? key}) : super(key: key);

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
      body: Container(
        child: ValueListenableBuilder(
          valueListenable: hiveDB.subCategoriesBoxListable(),
          builder: (BuildContext context, Box<SubCategoryHive> subcategoryBox,
              Widget? child) {
            Iterable<SubCategoryHive> subCategoryList = subcategoryBox.values
                .where((element) => element.category.id == this.category.id);
            return GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(8.0),
              children: <Widget>[
                for (SubCategoryHive subCategory in subCategoryList)
                  SubCategoryWidget(
                    subcategory: subCategory,
                  ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingHomeWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavBar(
        category: this.category,
      ),
    );
  }
}
