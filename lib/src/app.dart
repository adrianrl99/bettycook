import 'package:bettycook/src/config.dart';
import 'package:bettycook/src/constants.dart';
import 'package:bettycook/src/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  // @override
  // void initState() {
  //   super.initState();
  // }

  // @override
  // Future<void> dispose() async {
  //   await hiveDB.compactBoxes();
  //   await Hive.close();
  //   await db.closeDB();
  //   super.dispose();
  // }

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
    // return ValueListenableBuilder(
    // valueListenable: hiveDB.settingsBoxListable(),
    // builder: (BuildContext context, Box settingsBox, Widget? child) {
    // bool? settingsThemeMode = settingsBox.get(settingsBoxThemeModeKey);
    // ThemeMode? themeMode;
    // if (settingsThemeMode == true)
    // themeMode = ThemeMode.dark;
    // else if (settingsThemeMode == false) themeMode = ThemeMode.light;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "BettyCook",
      // themeMode: themeMode,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        accentColor: Color(0xFF9c40e3),
      ),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          brightness: Brightness.dark,
        ),
        primarySwatch: createMaterialColor(
          Color(0xFF5B178E),
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
              // case SearchCategoryPage.routeName:
              //   return SearchCategoryPage(
              //       category: settings.arguments as CategoryHive);
              // case SearchSubCategoryPage.routeName:
              //   return SearchSubCategoryPage(
              //       subcategory: settings.arguments as SubCategoryHive);
              case FavoritesPage.routeName:
                return FavoritesPage();
              case TipsPage.routeName:
                return TipsPage();
              // case CategoryPage.routeName:
              //   return CategoryPage(
              //       category: settings.arguments as CategoryHive);
              // case SubCategoryPage.routeName:
              //   return SubCategoryPage(
              //       subcategory: settings.arguments as SubCategoryHive);
              // case RecipePage.routeName:
              //   return RecipePage(recipe: settings.arguments as RecipeHive);
              case IWantCookPage.routeName:
                return IWantCookPage();
              // case CalendarPage.routeName:
              //   return CalendarPage();
              case ToBuyPage.routeName:
                return ToBuyPage();
              case ConverterPage.routeName:
                return ConverterPage();
              case AboutPage.routeName:
                return AboutPage();
              case SettingsPage.routeName:
                return SettingsPage();
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
    // },
    // );
  }
}
