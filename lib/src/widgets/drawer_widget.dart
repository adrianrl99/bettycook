import 'package:bettycook/src/config.dart';
import 'package:bettycook/src/constants.dart';
import 'package:bettycook/src/pages/pages.dart';
import 'package:bettycook/src/utils.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:share/share.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,
              otherAccountsPictures: [
                Container(
                  alignment: Alignment.topRight,
                  child: ValueListenableBuilder(
                    valueListenable: Hive.box(settingsBoxKey).listenable(),
                    builder: (context, Box box, _) {
                      bool? darkMode = box.get(settingsBoxDarkModeKey);

                      bool iconMode = darkMode == null
                          ? MediaQuery.platformBrightnessOf(context) ==
                              Brightness.dark
                          : darkMode;
                      return IconButton(
                        icon: Icon(
                          iconMode ? Icons.wb_sunny : Icons.nights_stay,
                          color: Colors.white,
                        ),
                        onPressed: () => currentTheme.switchTheme(context),
                      );
                    },
                  ),
                ),
              ],
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              accountName: Text("BettyCook"),
              accountEmail: Text("Tus recetas en un solo lugar"),
              currentAccountPicture: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/icon/splash.png"),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <ListTile>[
                  ListTile(
                      leading: Icon(Icons.favorite),
                      title: Text(FavoritesPage.title),
                      onTap: () {
                        Navigator.of(context).pop();
                        Navigator.of(context)
                            .pushNamed(FavoritesPage.routeName);
                      }),
                  ListTile(
                    leading: Icon(Icons.lightbulb),
                    title: Text(TipsPage.title),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pushNamed(TipsPage.routeName);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.kitchen),
                    title: Text(IWantCookPage.title),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pushNamed(IWantCookPage.routeName);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.calendar_today),
                    title: Text(CalendarPage.title),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pushNamed(CalendarPage.routeName);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.shopping_cart),
                    title: Text(ToBuyPage.title),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pushNamed(ToBuyPage.routeName);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.swap_horiz),
                    title: Text(ConverterPage.title),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pushNamed(ConverterPage.routeName);
                    },
                  ),
                  ListTile(
                      title: Text(
                    "Contáctanos",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                  ListTile(
                    leading: Icon(Icons.send),
                    title: Text("Telegram"),
                    onTap: () => launchURL("https://t.me/bettycook"),
                  ),
                  ListTile(
                    leading: Icon(Icons.mail),
                    title: Text("Correo"),
                    onTap: () => launchURL("mailto:bettycooksoporte@gmail.com"),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.share),
              title: Text("Comparte nuestra app"),
              onTap: () => Share.share(
                  "Descarga BettyCook en https://www.apklis.cu/\nTus recetas en un solo lugar",
                  subject: "BettyCook"),
            ),
            ListTile(
              leading: Icon(Icons.help_outline),
              title: Text(AboutPage.title),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(AboutPage.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
