import 'package:betsy_s_cookbook/src/components/bottom_nav_bar.dart';
import 'package:betsy_s_cookbook/src/components/home_page/home_home_favorite_widget.dart';
import 'package:betsy_s_cookbook/src/components/home_page/home_foods_widget.dart';
import 'package:betsy_s_cookbook/src/components/home_page/home_sweets_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String onPressedSearch;
  final String title;

  const HomePage(this.title, this.onPressedSearch, {Key key}) : super(key: key);

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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Flexible(
              fit: FlexFit.tight,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    HomeFoodsWidget(),
                    HomeSweetsWidget(),
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
                    Expanded(
                      child: Card(
                        color: Colors.red,
                        child: Text("Tip 1"),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        color: Colors.red,
                        child: Text("Tip 2"),
                      ),
                    ),
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
