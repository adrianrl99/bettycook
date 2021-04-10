import 'package:betsy_s_cookbook/src/components/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class SearchFavoritesPage extends StatelessWidget {
  final String title;

  const SearchFavoritesPage(this.title, {Key key}) : super(key: key);

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
