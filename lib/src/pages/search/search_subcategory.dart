import 'package:betsy_s_cookbook/src/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class SearchSubCategoryPage extends StatelessWidget {
  static const routeName = "/search/subcategory";
  final String title = "Buscar en Subcategorias";

  const SearchSubCategoryPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Center(
        child: Container(
          child: Text(this.title),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
