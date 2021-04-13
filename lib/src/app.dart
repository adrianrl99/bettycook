import 'package:betsy_s_cookbook/src/constants.dart';
import 'package:betsy_s_cookbook/src/database.dart';
import 'package:betsy_s_cookbook/src/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void dispose() {
    super.dispose();
    Hive.box(settingsBox).compact();
    Hive.box(favoritesBox).compact();
    Hive.close();
  }

  @override
  Widget build(BuildContext context) {
    RecipesDatabase db = RecipesDatabase();
    return ValueListenableBuilder(
      valueListenable: Hive.box(settingsBox).listenable(),
      builder: (context, box, widget) {
        var darkMode = box.get("darkMode", defaultValue: false);
        return FutureBuilder(
          future: db.initDB(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done)
              // if (false)
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
                onGenerateRoute: (RouteSettings settings) {
                  return MaterialPageRoute(
                    builder: (BuildContext context) {
                      switch (settings.name) {
                        case SearchAllPage.routeName:
                          return SearchAllPage();
                        case SearchFavoritesPage.routeName:
                          return SearchFavoritesPage();
                        case SearchTipsPage.routeName:
                          return SearchTipsPage();
                        case SearchCategoryPage.routeName:
                          return SearchCategoryPage();
                        case SearchSubCategoryPage.routeName:
                          return SearchSubCategoryPage();
                        case FavoritesPage.routeName:
                          return FavoritesPage();
                        case TipsPage.routeName:
                          return TipsPage();
                        case CategoryPage.routeName:
                          return CategoryPage(category: settings.arguments);
                        case SubCategoryPage.routeName:
                          return SubCategoryPage(
                              subcategory: settings.arguments);
                        case RecipePage.routeName:
                          return RecipePage(recipe: settings.arguments);
                      }
                    },
                  );
                },
              );
            else
              return LoadingScreen();
          },
        );
      },
    );
  }
}
