import 'package:bettycook/src/widgets/bottom_nav_bar.dart';
import 'package:bettycook/src/widgets/drawer_widget.dart';
import 'package:bettycook/src/widgets/home_page/home_categories_widget.dart';
import 'package:bettycook/src/widgets/home_page/home_favorite_widget.dart';
import 'package:bettycook/src/widgets/home_page/home_tip.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const routeName = "/";

  static const String title = "Inicio";

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("BettyCook"),
      ),
      drawer: DrawerWidget(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            HomeCategoriesWidget(),
            HomeFavoriteWidget(),
            HomeTip(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
