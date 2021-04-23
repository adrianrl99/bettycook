import 'package:bettycook/src/constants.dart';
import 'package:bettycook/src/database.dart';
import 'package:bettycook/src/models/models.dart';
import 'package:bettycook/src/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    _getTips();
  }

  @override
  void dispose() {
    for (String box in boxes) Hive.box(box).compact();
    Hive.close();
    super.dispose();
  }

  void _getTips() async {
    TipModel tip = await RecipesDatabase().getTipRandom();
    Hive.box(tipsBox).put('tip', [tip.id, tip.tip]);
  }

  MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    strengths.forEach((strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    });
    return MaterialColor(color.value, swatch);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box(settingsBox).listenable(),
      builder: (BuildContext context, Box box, _) {
        bool? darkMode = box.get(settingsBoxDarkModeKey);
        ThemeMode? darkThemeMode;
        if (darkMode != null)
          darkThemeMode = darkMode ? ThemeMode.dark : ThemeMode.light;
        else
          darkThemeMode = ThemeMode.system;
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "BettyCook",
          themeMode: darkThemeMode,
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            bottomNavigationBarTheme:
                BottomNavigationBarThemeData(selectedItemColor: Colors.white),
          ),
          theme: ThemeData(
            brightness: Brightness.light,
            appBarTheme: AppBarTheme(
              brightness: Brightness.dark,
            ),
            primarySwatch: createMaterialColor(
              Color(0xFF75414e),
            ),
          ),
          home: HomePage(),
          initialRoute: HomePage.routeName,
          onGenerateRoute: (RouteSettings settings) {
            return MaterialPageRoute(
              settings: settings,
              builder: (BuildContext context) {
                switch (settings.name) {
                  case SearchAllPage.routeName:
                    return SearchAllPage();
                  case SearchSubCategoryPage.routeName:
                    return SearchSubCategoryPage(
                        subcategory: settings.arguments as SubCategoryModel);
                  case FavoritesPage.routeName:
                    return FavoritesPage();
                  case TipsPage.routeName:
                    return TipsPage();
                  case CategoryPage.routeName:
                    return CategoryPage(
                        category: settings.arguments as CategoryModel);
                  case SubCategoryPage.routeName:
                    return SubCategoryPage(
                        subcategory: settings.arguments as SubCategoryModel);
                  case RecipePage.routeName:
                    return RecipePage(
                        recipe: settings.arguments as RecipeModel);
                  case IWantCookPage.routeName:
                    return IWantCookPage();
                  case CalendarPage.routeName:
                    return CalendarPage();
                  case ToBuyPage.routeName:
                    return ToBuyPage();
                  case ConverterPage.routeName:
                    return ConverterPage();
                  case AboutPage.routeName:
                    return AboutPage();
                  default:
                    return Center(
                      child: Container(
                        child: Text("404"),
                      ),
                    );
                }
              },
            );
          },
        );
      },
    );
  }
}
