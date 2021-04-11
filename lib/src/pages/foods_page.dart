import 'package:betsy_s_cookbook/src/widgets/bottom_nav_bar.dart';
import 'package:betsy_s_cookbook/src/widgets/category_widget.dart';
import 'package:flutter/material.dart';

class FoodsPage extends StatelessWidget {
  static const routeName = "/foods";
  static const onPressedSearch = "/search$routeName";
  final String title = "Comidas";

  const FoodsPage({Key key}) : super(key: key);

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
      body: Container(
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      "Categoria 1",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      CategoryWidget("Carne", "assets/images/default.png"),
                      CategoryWidget(
                        "Carne",
                        "assets/images/default.png",
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      CategoryWidget(
                        "Carne",
                        "assets/images/default.png",
                      ),
                      CategoryWidget(
                        "Carne",
                        "assets/images/default.png",
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      "Categoria 1",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      CategoryWidget(
                        "Carne",
                        "assets/images/default.png",
                      ),
                      CategoryWidget(
                        "Carne",
                        "assets/images/default.png",
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      CategoryWidget(
                        "Carne",
                        "assets/images/default.png",
                      ),
                      CategoryWidget(
                        "Carne",
                        "assets/images/default.png",
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
