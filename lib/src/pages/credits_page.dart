import 'package:bettycook/src/functions.dart';
import 'package:bettycook/src/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class CreditsPage extends StatelessWidget {
  static const routeName = "/credits";
  static const title = "Creditos";
  const CreditsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Center(
                child: Text(
                  "Desarrollador y diseñador UI/UX",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              subtitle: Center(
                  child: GestureDetector(
                onTap: () =>
                    launchURL("https://porfolio-adrianrl99.vercel.app/"),
                child: Text(
                  "Adrian López Cintas",
                ),
              )),
            ),
            ListTile(
              title: Center(
                child: Text(
                  "Diseñador audiovisual",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              subtitle: Center(
                  child: GestureDetector(
                onTap: () =>
                    launchURL("https://www.instagram.com/markus_anthony.film"),
                child: Text(
                  "Marcos",
                ),
              )),
            ),
            ListTile(
              title: Center(
                child: Text(
                  "Editora de contenido",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              subtitle: Center(
                  child: GestureDetector(
                child: Text(
                  "Betsy Cintas",
                ),
              )),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
