import 'package:bettycook/src/config.dart';
import 'package:bettycook/src/pages/pages.dart';
import 'package:bettycookplugins/bettycookplugins.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:package_info/package_info.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  bool loading = true;

  @override
  void initState() {
    super.initState();
    initApp();
  }

  Future<void> initApp() async {
    await hiveDB.initMobile();
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    await hiveDB.checkMobileVersion(
      appName: packageInfo.appName,
      buildNumber: packageInfo.buildNumber,
      packageName: packageInfo.packageName,
      version: packageInfo.version,
    );
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return !loading
        ? ValueListenableBuilder(
            valueListenable: hiveDB.settingsBoxBaseListable(),
            builder:
                (BuildContext context, Box settingsBoxBase, Widget? child) {
              bool? settingsThemeMode =
                  settingsBoxBase.get(settingsBoxThemeModeKey);
              ThemeMode? themeMode;
              if (settingsThemeMode == true)
                themeMode = ThemeMode.dark;
              else if (settingsThemeMode == false) themeMode = ThemeMode.light;
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: "BettyCook",
                themeMode: themeMode,
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
                        case SearchCategoryPage.routeName:
                          return SearchCategoryPage(
                              category: settings.arguments as CategoryHive);
                        case SearchSubCategoryPage.routeName:
                          return SearchSubCategoryPage(
                              subcategory:
                                  settings.arguments as SubCategoryHive);
                        case FavoritesPage.routeName:
                          return FavoritesPage();
                        case TipsPage.routeName:
                          return TipsPage();
                        case CategoryPage.routeName:
                          return CategoryPage(
                              category: settings.arguments as CategoryHive);
                        case SubCategoryPage.routeName:
                          return SubCategoryPage(
                              subCategory:
                                  settings.arguments as SubCategoryHive);
                        case RecipePage.routeName:
                          return RecipePage(
                              recipe: settings.arguments as RecipeHive);
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
            },
          )
        : Container(
            color: Color(0xFF212121),
            child: Stack(
              textDirection: TextDirection.ltr,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Container(
                    height: 100,
                    width: 100,
                    child: Image.asset(
                      "assets/icon/splash.png",
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 50.0),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 20),
                      Text(
                        "Cargando base de datos",
                        textDirection: TextDirection.ltr,
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
  }
}
