import 'package:bettycook/src/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class SearchAllPage extends StatelessWidget {
  static const routeName = "/search";
  final String title = "Buscar en todos";

  const SearchAllPage({Key key}) : super(key: key);

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
