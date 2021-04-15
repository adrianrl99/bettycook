import 'package:bettycook/src/pages/pages.dart';
import 'package:bettycook/src/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class SearchCategoryPage extends StatelessWidget {
  static const routeName =
      "${SearchAllPage.routeName}${CategoryPage.routeName}";
  final String title = "Buscar en categorias";

  const SearchCategoryPage({Key key}) : super(key: key);

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
