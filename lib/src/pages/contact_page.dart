import 'package:bettycook/src/functions.dart';
import 'package:bettycook/src/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class ConactPage extends StatelessWidget {
  static const routeName = "/contact";
  static const title = "Contáctanos";
  const ConactPage() : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ElevatedButton(
              child: Text("Canal de telegram"),
              onPressed: () => launchURL("https://t.me/bettycook"),
            ),
            ElevatedButton(
              child: Text("Grupo de telegram"),
              onPressed: () => launchURL("https://t.me/bettycookgroup"),
            ),
            ElevatedButton(
              child: Text("Correo"),
              onPressed: () => launchURL("mailto:bettycooksoporte@gmail.com"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
