import 'package:betsy_s_cookbook/src/constants.dart';
import 'package:betsy_s_cookbook/src/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box(darkModeBox).listenable(),
      builder: (context, box, widget) {
        var darkMode = box.get("darkMode", defaultValue: false);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Betsy's CookBook",
          themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
          darkTheme: ThemeData.dark(),
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: HomePage(),
          initialRoute: HomePage.routeName,
          routes: {
            SearchAllPage.routeName: (BuildContext context) => SearchAllPage(),
            SearchFavoritesPage.routeName: (BuildContext context) =>
                SearchFavoritesPage(),
            SearchTipsPage.routeName: (BuildContext context) =>
                SearchTipsPage(),
            SearchFoodsPage.routeName: (BuildContext context) =>
                SearchFoodsPage(),
            SearchSweetsPage.routeName: (BuildContext context) =>
                SearchSweetsPage(),
            SearchSubCategoryPage.routeName: (BuildContext context) =>
                SearchSubCategoryPage(),
            FavoritesPage.routeName: (BuildContext context) => FavoritesPage(),
            TipsPage.routeName: (BuildContext context) => TipsPage(),
            FoodsPage.routeName: (BuildContext context) => FoodsPage(),
            SweetsPage.routeName: (BuildContext context) => SweetsPage(),
            SubCategoryPage.routeName: (BuildContext context) =>
                SubCategoryPage(),
            RecipePage.routeName: (BuildContext context) => RecipePage()
          },
        );
      },
    );
  }
}
