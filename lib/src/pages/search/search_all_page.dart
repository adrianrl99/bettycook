import 'package:betsy_s_cookbook/src/components/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class SearchAllPage extends StatelessWidget {
  final String title;

  const SearchAllPage(this.title, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Center(
        child: Container(
          child: Text("Buscar Todo"),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
