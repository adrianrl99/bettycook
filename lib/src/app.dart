import 'package:betsy_s_cookbook/src/pages/favorites_page.dart';
import 'package:betsy_s_cookbook/src/pages/home_page.dart';
import 'package:betsy_s_cookbook/src/pages/search/search_all_page.dart';
import 'package:betsy_s_cookbook/src/pages/search/search_favorites_page.dart';
import 'package:betsy_s_cookbook/src/pages/search/search_foods.dart';
import 'package:betsy_s_cookbook/src/pages/search/search_tips_page.dart';
import 'package:betsy_s_cookbook/src/pages/tips_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Betsy's CookBook",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage("Inicio", '/search/all'),
      initialRoute: "/",
      routes: {
        "/search/all": (BuildContext context) =>
            SearchAllPage("Buscar en todo"),
        "/search/favorites": (BuildContext context) =>
            SearchFavoritesPage("Buscar en favoritos"),
        "/search/tips": (BuildContext context) =>
            SearchTipsPage("Buscar en tips"),
        "/search/foods": (BuildContext context) =>
            SearchFoodsPage("Buscar en comidas"),
        "/search/sweets": (BuildContext context) =>
            SearchFoodsPage("Buscar en dulces"),
        "/favorites": (BuildContext context) =>
            FavoritesPage("Favoritos", "/search/favorites"),
        "/tips": (BuildContext context) => TipsPage("Tips", "/search/tips"),
        "/foods": (BuildContext context) =>
            TipsPage("Comidas", "/search/foods"),
        "/sweets": (BuildContext context) =>
            TipsPage("Dulces", "/search/sweets"),
      },
    );
  }
}
