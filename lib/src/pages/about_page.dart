import 'package:bettycook/src/utils.dart';
import 'package:bettycook/src/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  static const routeName = "/about";
  static const title = "Acerca de la app";
  const AboutPage({Key? key}) : super(key: key);

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
