import 'package:bettycook/src/constants.dart';
import 'package:bettycook/src/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget() : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: Column(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Stack(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/icon/icon.png"),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    child: ValueListenableBuilder(
                      valueListenable: Hive.box(settingsBox).listenable(),
                      builder: (context, Box box, _) {
                        var darkMode = box.get(settingsBoxDarkModeKey,
                            defaultValue: false);
                        return IconButton(
                          icon: Icon(
                            darkMode ? Icons.wb_sunny : Icons.nights_stay,
                            color: Colors.white,
                          ),
                          onPressed: () =>
                              box.put(settingsBoxDarkModeKey, !darkMode),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.kitchen),
              title: Text(IWantCookPage.title),
              onTap: () =>
                  Navigator.of(context).pushNamed(IWantCookPage.routeName),
            ),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text(CalendarPage.title),
              onTap: () =>
                  Navigator.of(context).pushNamed(CalendarPage.routeName),
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text(ToBuyPage.title),
              onTap: () => Navigator.of(context).pushNamed(ToBuyPage.routeName),
            ),
            ListTile(
              leading: Icon(Icons.support_agent),
              title: Text(ConactPage.title),
              onTap: () =>
                  Navigator.of(context).pushNamed(ConactPage.routeName),
            ),
          ],
        ),
      ),
    );
  }
}
