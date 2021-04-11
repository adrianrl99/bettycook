import 'package:betsy_s_cookbook/src/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class SweetsPage extends StatelessWidget {
  static const routeName = "/sweets";
  static const onPressedSearch = "/search$routeName";
  final String title = "Dulces";

  const SweetsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.of(context).pushNamed(onPressedSearch);
            },
          ),
        ],
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
