import 'package:betsy_s_cookbook/src/pages/pages.dart';
import 'package:betsy_s_cookbook/src/widgets/bottom_nav_bar.dart';
import 'package:betsy_s_cookbook/src/widgets/home_page/home_categories_widget.dart';
import 'package:betsy_s_cookbook/src/widgets/home_page/home_favorite_widget.dart';
import 'package:betsy_s_cookbook/src/widgets/home_page/home_tip.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const routeName = "/";

  final String title = "Inicio";

  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.of(context).pushNamed(SearchAllPage.routeName);
            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            HomeCategoriesWidget(),
            Flexible(
              fit: FlexFit.tight,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    HomeFavoriteWidget(),
                  ],
                ),
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    HomeTip(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
