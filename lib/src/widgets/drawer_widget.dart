import 'package:bettycook/src/constants.dart';
import 'package:bettycook/src/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key key}) : super(key: key);

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
                            darkMode ? Icons.nights_stay : Icons.wb_sunny,
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
              leading: Icon(Icons.help),
              title: Text("Contáctanos"),
              onTap: () =>
                  Navigator.of(context).pushNamed(ConactPage.routeName),
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text("Creditos"),
              onTap: () =>
                  Navigator.of(context).pushNamed(CreditsPage.routeName),
            ),
          ],
        ),
      ),
    );
  }
}
