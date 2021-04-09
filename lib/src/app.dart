import 'package:betsy_s_cookbook/src/pages/favorites_page.dart';
import 'package:betsy_s_cookbook/src/pages/home_page.dart';
import 'package:betsy_s_cookbook/src/pages/search/search_all_page.dart';
import 'package:betsy_s_cookbook/src/pages/search/search_favorites_page.dart';
import 'package:betsy_s_cookbook/src/pages/search/search_tips_page.dart';
import 'package:betsy_s_cookbook/src/pages/tips_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Betsy's CookBook",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        "/": (BuildContext context) => HomePage("Inicio", "/search-all"),
        "/search-all": (BuildContext context) =>
            SearchAllPage("Buscar en todo"),
        "/search-favorites": (BuildContext context) =>
            SearchFavoritesPage("Buscar en todo"),
        "/search-tips": (BuildContext context) =>
            SearchTipsPage("Buscar en tips"),
        "/favorites": (BuildContext context) =>
            FavoritesPage("Favoritos", "/search-favorites"),
        "/tips": (BuildContext context) => TipsPage("Tips", "/search-tips")
      },
    );
  }
}
