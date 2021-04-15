import 'package:bettycook/src/widgets/bottom_nav_bar.dart';
import 'package:bettycook/src/pages/pages.dart';
import 'package:flutter/material.dart';

class SearchTipsPage extends StatelessWidget {
  static const routeName = "${SearchAllPage.routeName}${TipsPage.routeName}";
  final String title = "Buscar en tips";

  const SearchTipsPage({Key key}) : super(key: key);

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
